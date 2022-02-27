import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:furniture_app/core/models/user_model.dart';

import '../../../screens/providers/auth_provider/auth_provider.dart';

class ShippingPageService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // ? Current User Document

  static final uid =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;
  // ? Address list is empty?

  

  // ? ShippingAddress Page Stream

  static final userShippingStream = FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .snapshots(includeMetadataChanges: true);

  // ? ShppingAddress Page add item

  static addItemToShppingAddress(ShippingAddress model) async {
    await userCollection.doc(uid).update({
      "shipping_address": FieldValue.arrayUnion([model.toJson()])
    });
  }

  // ? ShppingAddress Page Delete item

  static deleteFromShipping(ShippingAddress model) async {
    userCollection.doc(uid).update({
      "shipping_address": FieldValue.arrayRemove([model.toJson()])
    }).catchError((e) => print(e));
  }

  // ? ShppingAddress Page Update item

  static updateAdress(
      {required ShippingAddress address,
      required TextEditingController name,
      required TextEditingController adressController}) async {
    await userCollection.doc(uid).update({
      "shipping_address": FieldValue.arrayRemove([address.toJson()])
    }).catchError((e) => print(e));

    address.address = adressController.text;
    address.name = name.text;

    await userCollection.doc(uid).update({
      "shipping_address": FieldValue.arrayUnion([address.toJson()])
    }).catchError((e) => print(e));
  }
}
