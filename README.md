
# ChadPepe (CHAD)

ChadPepe es una moneda ERC20 desarrollada en la cadena de bloques Ethereum.

## Contratos

- `ChadPepe.sol`: Contrato del token CHAD.
- `ChadPepeCrowdsale.sol`: Contrato para la venta de tokens CHAD en un evento de crowdsale.

## Despliegue

ChadPepe y ChadPepeCrowdsale se pueden desplegar en la red de Ethereum utilizando Truffle. Para desplegar los contratos, sigue estos pasos:

1. Clona este repositorio: `git clone https://github.com/TU_USUARIO/chadpepe.git`
2. Instala las dependencias: `npm install`
3. Configura tus variables de entorno creando un archivo `.env` con las siguientes variables:

```
MNEMONIC=tu_mnemonic
INFURA_PROJECT_ID=tu_infura_project_id
```

4. Compila los contratos: `truffle compile`
5. Despliega los contratos en la red de tu elección:

```
truffle migrate --network development  # red de desarrollo
truffle migrate --network ropsten      # red de pruebas de Ropsten
truffle migrate --network mainnet      # red principal de Ethereum
```

## Uso

### Compra de tokens

Los tokens CHAD se pueden comprar en el evento de crowdsale utilizando ether (ETH). El contrato de crowdsale se encarga de hacer la conversión entre ether y CHAD. Para comprar tokens CHAD, sigue estos pasos:

1. Asegúrate de tener ether en tu cuenta de Ethereum.
2. Obtén la dirección del contrato de crowdsale.
3. Envía ether a la dirección del contrato de crowdsale.
4. Los tokens CHAD se enviarán automáticamente a la dirección desde la que se envió el ether.

### Transferencia de tokens

Los tokens CHAD se pueden transferir utilizando cualquier cartera compatible con ERC20. Para transferir tokens CHAD, sigue estos pasos:

1. Abre tu cartera Ethereum compatible con ERC20.
2. Agrega CHAD a tu cartera utilizando el contrato del token CHAD (`ChadPepe.sol`).
3. Selecciona la cantidad de tokens CHAD que deseas transferir y la dirección del destinatario.
4. Confirma la transacción y espera a que se confirme en la red de Ethereum.

## Autores

- kmikodev

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para obtener más detalles.