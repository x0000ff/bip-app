# Bip! App 

![bip logo](./img/logo.png)

Simple app for check Bip! card balance.
Used as demonstration example of Singletons and Dependency Injection

## API

Uses simpe api from [x0000ff/bip-api](https://github.com/x0000ff/bip-api)

### Example responses

#### Success

```json
{
  "error": null,
  "status": {
    "number": "21922111",
    "message": "Tarjeta Valida",
    "valid": true,
    "balance": 170,
    "date": "2018-12-04T22:43:00.000Z"
  }
}
```

#### Failure

```json
{
  "error": "Esta tarjeta no se puede cargar"
}
```

## Demonstration

| Success | Failure |
|---|---|
| ![Success](./img/success.gif) | ![Failure](./img/failure.gif) |
## Credits

- Create great app icons with [MakeAppIcon](https://makeappicon.com)