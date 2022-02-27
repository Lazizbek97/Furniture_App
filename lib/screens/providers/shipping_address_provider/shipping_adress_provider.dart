import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_app/core/models/user_model.dart';

import '../auth_provider/auth_provider.dart';

class ShippingAddressProvider extends ChangeNotifier {
  int checked = 0;
  bool yesAdress = false;
  ShippingAddress? addressModel;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final uid =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;

  chooseAsAdress(int index) async {
    checked = index;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) {
      addressModel = ShippingAddress.fromJson(
          (value.data()!['shipping_address'] as List)[checked]);
    });

    notifyListeners();
  }

  // ?check address list
  Future checkAddressList() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) async {
      (value.data()!['shipping_address'] as List).isNotEmpty
          ? yesAdress = true
          : yesAdress = false;
      yesAdress
          ? addressModel = ShippingAddress.fromJson(
              (value.data()!['shipping_address'] as List)[checked])
          : null;
    });

    notifyListeners();
    return yesAdress;
  }
}
