import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../../../core/models/user_model.dart';

class UserInfoService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  static addNewUser({
    required BuildContext context,
    required TextEditingController emailConstroller,
    required TextEditingController nameConstroller,
    required TextEditingController passwordConstroller,
  }) async {
    userCollection
        .doc(emailConstroller.text)
        .set(UserModel(
          email: emailConstroller.text,
          name: nameConstroller.text,
          password: passwordConstroller.text,
          favorites: [],
          image: "",
          myCart: [],
          myReviews: [],
          notifications: [],
          paymentMethods: [],
          shippingAddress: [],
          orders: Orders(canceled: [], delivered: [], proccessing: []),
        ).toJson())
        .then(
          (value) => Navigator.pushNamedAndRemoveUntil(
            context,
            "/home_page",
            (route) => false,
          ),
        );
  }
}
