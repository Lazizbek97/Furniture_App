import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../auth_provider/auth_provider.dart';

class ChangeProfilePicture extends ChangeNotifier {
  File? file;

  String? profilePicLink =
      AuthProvider(FirebaseAuth.instance).fireBaseAuth.currentUser!.photoURL;

  reloadPicLink() async {
    profilePicLink = await AuthProvider(FirebaseAuth.instance)
        .fireBaseAuth
        .currentUser!
        .photoURL;
    notifyListeners();
  }

  Future uploadPicture() async {
    final filePicker = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (filePicker == null) {
      return null;
    }
    final path = filePicker.files.single.path;
    file = File(path!);
    print(file!.path);

// ? Upload selected file

    if (file == null) return;

    final fileName = file!.path.split("/").last;
    final distenation = "photos/$fileName";
    try {
      final ref = FirebaseStorage.instance.ref(distenation);
      await ref.putFile(file!);

      //  ? quyida rasmni internetdagi linki joylashgan manzil berilgan
      ref.getDownloadURL().then((value) async {
        print(value);
        await AuthProvider(FirebaseAuth.instance)
            .fireBaseAuth
            .currentUser!
            .updatePhotoURL(value);
        profilePicLink = await AuthProvider(FirebaseAuth.instance)
            .fireBaseAuth
            .currentUser!
            .photoURL;

        notifyListeners();

        return value;
      });
    } on FirebaseException catch (e) {
      print("Xatoo: $e");
    }
  }
}
