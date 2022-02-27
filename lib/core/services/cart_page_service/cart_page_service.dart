

// class CartPageService {
//   static CollectionReference userCollection =
//       FirebaseFirestore.instance.collection("users");

//   // ? Current User Document

//   static final uid =
//       AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;

//   // ? MyCart Page Stream

//   static final userCartStream = FirebaseFirestore.instance
//       .collection("users")
//       .where("email",
//           isEqualTo: AuthProvider(FirebaseAuth.instance)
//               .fireBaseAuth
//               .currentUser!
//               .email)
//       .snapshots(includeMetadataChanges: true);

//   // ? MyCart Page add item

//   static addItemToCard(Item model) async {
//     await userCollection.doc(uid).update({
//       "my_cart": FieldValue.arrayUnion([model.toJson()])
//     });
//   }

//   // ? MyCart Page Delete item

//   static deleteFromCart(Item model) async {
//     userCollection.doc(uid).update({
//       "my_cart": FieldValue.arrayRemove([model.toJson()])
//     }).catchError((e) => print(e));
//   }
// }
