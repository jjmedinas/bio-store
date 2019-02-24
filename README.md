
# README Bio Store

## To run the project
1. `docker-compose build`
2. `docker-compose run --rm web rails db:create`
3. `docker-compose run --rm web rails db:migrate`
4. `docker-compose run web rails db:seed`
5. `docker-compose up`


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

## List Users
- `GET /users/`

You can filter out users by role. It can be on of `['seller', 'buyer', 'admin']`. Or by state `['active', 'blocked']`

Example:  `/users?role=buyer&state=blocked`



## Block Users

It is used to block a user. User id needs to be sent.

- `POST /users/block`
  Payload:

  ```
    {
      "id": 1
    }
## Unblock Users

It is used to unblock a user. User id needs to be sent.

- `POST /users/unblock`
  Payload:

  ```
    {
      "id": 1
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



## Create Category

It is used to create categories.

- `POST /categories/`
  Payload:


  ```
  {
  "category": {
    "name": "Suplementos",
    }
  }
### Upload Category  Image

It is used to upload a category image.

- `POST /categories/:slug/upload_image`

## Create Product

It is used to create products.

- `POST /products/`
  Payload:

  ```
  {
  "product": {
    "name": "Producto tal tal subir peso",
    "category_id": "1",
    "user_id": "2",
    "description": "Ganador de peso. asddm ,asd3 sd",
    "stock": 40,
    "price": 15000
    }
  }
### Upload  Product  Images

It is used to upload several images for a product.

- `POST /products/:slug/upload_images`

## List Invoices
- `GET /invoices/`

It returns the invoices for the current user.
If the current_user is a buyer, it returns
```
  {
    "compras": [
        {
            "identifier": "c83fe604-94dc-3774999f24e2",
            "seller": "Pepito Perez",
            "description": "Product One x3, Product Two x2",
            "total": 32421,
            "sending_address": null
        }
    ]
  }
```
If the current_user is a seller, it returns
```
  {
    "ventas": [
        {
            "identifier": "c83fe604-94dc-3774999f24e2",
            "seller": "Pepito Perez",
            "description": "Product One x3, Product Two x2",
            "total": 32421,
            "sending_address": null
        }
    ]
  }
```