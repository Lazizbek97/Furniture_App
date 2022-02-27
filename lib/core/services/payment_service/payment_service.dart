import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/core/models/user_model.dart';

import '../../../screens/providers/auth_provider/auth_provider.dart';

class PaymentPageService extends ChangeNotifier {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // ? PaymentMethod Page add item

  static addItemToPaymentMethod({
    required TextEditingController holderName,
    required TextEditingController cardNumber,
    required TextEditingController cvvCode,
    required TextEditingController expirationDate,
  }) async {
    PaymentMethod model = PaymentMethod(
      cardNumber: cardNumber.text,
      cvvCode: cvvCode.text,
      expirationDate: expirationDate.text,
      holderName: holderName.text,
    );
    await userCollection
        .doc(
            AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email)
        .update({
      "payment_methods": FieldValue.arrayUnion([model.toJson()])
    });
  }

  // ? PaymentMethod Page Delete item

  static deleteFromPaymentMethod({required PaymentMethod model}) async {
    userCollection
        .doc(
            AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email)
        .update({
      "payment_methods": FieldValue.arrayRemove([model.toJson()])
    }).catchError((e) => print(e));
  }
}
