class UserData {
  static Map data = {
    "name": "",
    "email": "",
    "password": "",
    "my_cart": [],
    "favorites": [],
    "notifications": [],
    "my_reviews": [
      {"name": "", "price": "", "rating": 0.0, "date": "", "review": ""}
    ],
    "payment_methods": [
      {
        "holder_name": "",
        "card_number": "",
        "cvv_code": "",
        "expiration_date": ""
      }
    ],
    "shipping_address": [
      {
        "name": "",
        "address": "",
        "zip_code": 0,
        "country": "",
        "city": "",
        "district": ""
      }
    ],
    "orders": {
      "delivered": [
        {"id": "", "date": "", "quantity": 0, "total_amount": 0.0, "items": []}
      ],
      "proccessing": [
        {"id": "", "date": "", "quantity": 0, "total_amount": 0.0, "items": []}
      ],
      "canceled": [
        {"id": "", "date": "", "quantity": 0, "total_amount": 0.0, "items": []}
      ],
    }
  };
}
