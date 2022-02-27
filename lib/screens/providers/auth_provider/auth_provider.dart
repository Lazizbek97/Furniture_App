import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth fireBaseAuth;
  late User? curUser = fireBaseAuth.currentUser;
  AuthProvider(this.fireBaseAuth);

  Stream<User?> get authChanges => fireBaseAuth.authStateChanges();

  Future signOut() async {
    await fireBaseAuth.signOut();
    notifyListeners();
  }

  Future signIn({required String email, required String password}) async {
    try {
      await fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      notifyListeners();
      return "signed in";
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }

  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        curUser = fireBaseAuth.currentUser;
        User? user = value.user;
        await user!.updateDisplayName(name);
      });

      notifyListeners();
      return "signed in";
    } on FirebaseAuthException catch (e) {
      notifyListeners();
      return e.message;
    }
  }

  updateUserNameEmail(String name, String email) async {
    final uid =
        AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.email;

    String? password;
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((value) => password = value['password']);
    await fireBaseAuth.currentUser!.updateDisplayName(name);
    await fireBaseAuth.currentUser!.updateEmail(email);

    notifyListeners();
  }
}
