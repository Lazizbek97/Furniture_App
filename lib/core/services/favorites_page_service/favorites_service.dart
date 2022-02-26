import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../screens/providers/auth_provider/auth_provider.dart';
import '../../models/furniture_model.dart';

class FavoritesPageService {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // ? Current User Document

  static final uid =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;

  // ? Favorites Page Stream

  static final userFavoriteStream = FirebaseFirestore.instance
      .collection("users")
      .where("email",
          isEqualTo: AuthProvider(FirebaseAuth.instance)
              .fireBaseAuth
              .currentUser!
              .email)
      .snapshots(includeMetadataChanges: true);

  // ? Favorites Page add item

  static addItemToFavorites(Item model) async {
    await userCollection.doc(uid).update({
      "favorites": FieldValue.arrayUnion([model.toJson()])
    });
  }

  // ? Favorites Page Delete item

  static deleteFromFavorites(Item model) async {
    userCollection.doc(uid).update({
      "favorites": FieldValue.arrayRemove([model.toJson()])
    }).catchError((e) => print(e));
  }
}
