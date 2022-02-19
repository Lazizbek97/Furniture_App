import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required TextEditingController passwordConstroller,
    required String hintText,
  })  : _passwordConstroller = passwordConstroller,
        _hintText = hintText,
        super(key: key);

  final TextEditingController _passwordConstroller;
  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordConstroller,
      obscureText: false,
      decoration: InputDecoration(
        labelText: _hintText,
        labelStyle: TextStyle(
          fontSize: Constants.disTextSize,
          color: Constants.color90,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Constants.inputBorderColor,
          ),
        ),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
