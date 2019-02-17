
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

- `POST /categories/`
  Payload:

  ```
  {
  "product": {
    "name": "Producto tal tal subir peso",
    "category_id": "1",
    "user_id": "2",
    "description": "Ganador de peso. asddm ,asd3 sd",
    "stock": 40,
    "price": 15.000
    }
  }
### Upload  Product  Images

It is used to upload several images for a product.

- `POST /products/:slug/upload_images`