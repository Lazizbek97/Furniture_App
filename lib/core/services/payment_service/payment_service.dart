import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/core/models/user_model.dart';

import '../../../screens/providers/auth_provider/auth_provider.dart';

class PaymentPageService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // ? Current User Document

  static final uid =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;
  // ? Payment Page Stream

  static final userPaymentStream = FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .snapshots(includeMetadataChanges: true);

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
    await userCollection.doc(uid).update({
      "payment_methods": FieldValue.arrayUnion([model.toJson()])
    });
  }

  // ? PaymentMethod Page Delete item

  static deleteFromPaymentMethod({required PaymentMethod model}) async {
    userCollection.doc(uid).update({
      "payment_methods": FieldValue.arrayRemove([model.toJson()])
    }).catchError((e) => print(e));
  }

  // // ? ShppingAddress Page Update item

  // static updatePaymentMethod({
  //   required PaymentMethod paymentMethod,
  //   required TextEditingController holderName,
  //   required TextEditingController cardNumber,
  //   required TextEditingController cvvCode,
  //   required TextEditingController expirationDate,
  // }) async {
  //   await userCollection.doc(uid).update({
  //     "payment_methods": FieldValue.arrayRemove([paymentMethod.toJson()])
  //   }).catchError((e) => print(e));

  //   paymentMethod.cardNumber = cardNumber.text;
  //   paymentMethod.holderName = holderName.text;
  //   paymentMethod.cvvCode = cvvCode.text;
  //   paymentMethod.expirationDate = expirationDate.text;

  //   await userCollection.doc(uid).update({
  //     "payment_methods": FieldValue.arrayUnion([paymentMethod.toJson()])
  //   }).catchError((e) => print(e));
  // }
}
