## PowerShell
Invoke-WebRequest -Uri "http://20.207.107.231:8000/api/cart-items"


## Get
curl -X GET http://127.0.0.1:8000/api/cart-items/
curl -X GET http://127.0.0.1:8000/api/cart-items/1


## Update
$ curl -X POST -H "Content-Type: application/json" http://127.0.0.1:8000/api/cart-items/ -d "{\"product_name\":\"name\",\"product_price\":\"41\",\"product_quantity\":\"1\"}"

$ curl -X POST -H "Content-Type: application/json" http://127.0.0.1:8000/api/cart-items/ -d "{\"product_name\":\"name\",\"product_price\":\"41\",\"product_quantity\":\"One\"}"


## Patch
curl -X PATCH http://127.0.0.1:8000/api/cart-items/1 -H 'Content-Type: application/json' -d '{"product_quantity":6}'


## Delete
$ curl -X "DELETE" http://127.0.0.1:8000/api/cart-items/1
