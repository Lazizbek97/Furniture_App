import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/models/user_model.dart';

import '../auth_provider/auth_provider.dart';

class PaymentProvider extends ChangeNotifier {
  int checked = 0;
  bool yesAdress = false;
  PaymentMethod? paymentModel;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final uid =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;

  chooseAsPaymentMethod(int index) async {
    checked = index;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      paymentModel = PaymentMethod.fromJson(
          (value.data()!['payment_methods'] as List)[checked]);
    });

    notifyListeners();
  }

  // ?check address list
  Future checkPaymentMethodList() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) async {
      (value.data()!['payment_methods'] as List).isNotEmpty
          ? yesAdress = true
          : yesAdress = false;
      yesAdress
          ? paymentModel = PaymentMethod.fromJson(
              (value.data()!['payment_methods'] as List)[checked])
          : null;
    });

    notifyListeners();
    return yesAdress;
  }
}
