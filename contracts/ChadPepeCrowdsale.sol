// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";



contract ChadPepeCrowdsale is Ownable, ReentrancyGuard {
    using SafeMath for uint256;

    IERC20 public token;
    uint256 public rate;
    uint256 public weiRaised;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor(uint256 _rate, address _tokenAddress) {
        require(_rate > 0, "ChadPepeCrowdsale: rate is 0");
        require(_tokenAddress != address(0), "ChadPepeCrowdsale: token is the zero address");

        rate = _rate;
        token = IERC20(_tokenAddress);
    }

    receive() external payable {
        buyTokens(msg.sender);
    }

    function buyTokens(address beneficiary) public nonReentrant payable {
        uint256 weiAmount = msg.value;
        _preValidatePurchase(beneficiary, weiAmount);

        uint256 tokens = _getTokenAmount(weiAmount);

        weiRaised = weiRaised.add(weiAmount);

        _processPurchase(beneficiary, tokens);
        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);

        _updatePurchasingState(beneficiary, weiAmount);

        _forwardFunds();
        _postValidatePurchase(beneficiary, weiAmount);
    }

    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal pure {
        require(beneficiary != address(0), "ChadPepeCrowdsale: beneficiary is the zero address");
        require(weiAmount != 0, "ChadPepeCrowdsale: weiAmount is 0");
    }

    function _postValidatePurchase(address beneficiary, uint256 weiAmount) internal pure {
        // Can be overridden to add custom post-validation logic
    }

    function _deliverTokens(address beneficiary, uint256 tokenAmount) internal {
        token.transferFrom(owner(), beneficiary, tokenAmount);
    }

    function _processPurchase(address beneficiary, uint256 tokenAmount) internal {
        _deliverTokens(beneficiary, tokenAmount);
    }

    function _updatePurchasingState(address beneficiary, uint256 weiAmount) internal {
        // Can be overridden to add custom purchasing state update logic
    }

    function _getTokenAmount(uint256 weiAmount) internal view returns (uint256) {
        return weiAmount.mul(rate);
    }

    function _forwardFunds() internal {
        payable(owner()).transfer(msg.value);
    }

    function setRate(uint256 newRate) external onlyOwner {
        require(newRate > 0, "ChadPepeCrowdsale: new rate is 0");
        rate = newRate;
    }
}