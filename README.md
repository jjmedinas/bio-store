# README Bio Store


## Create Users

It is used to create users.  'role' can be `['seller', 'buyer', 'admin']`

- `POST /signup/`
  Payload:


  ```
  {
  "user": {
    "name": "juan",
    "nickname": "jjmedinas",
    "email": "juan@medina.com",
    "password": "123erwfsd23ed",
    "role": "seller"
    }
  }

## Create Token / Login

It creates and returns JWT  in the Authorization Bearer header

- `POST /login/`
  Payload:

  ```
  {
  "user": {
    "email": "juan@medina.com",
    "password": "12345678"
    }
  }