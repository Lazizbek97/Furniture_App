import 'package:flutter/material.dart';

class SnackBarWidget {
  static show(String result, BuildContext context) async {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(result)));
  }
}
