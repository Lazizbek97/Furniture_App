import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  late final FirebaseAuth fireBaseAuth;
  late User? curUser  = fireBaseAuth.currentUser;
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
          .then((value) {
            
        // curUser = fireBaseAuth. as UserCredential;
        User? user = value.user;
        user!.updateDisplayName(name);
      
        print(user);
      });

      notifyListeners();
      return "signed in";
    } on FirebaseAuthException catch (e) {
      print(e);
      notifyListeners();
      return e.message;
    }
  }
}
