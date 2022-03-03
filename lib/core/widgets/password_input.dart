import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    Key? key,
    required TextEditingController passwordConstroller,
    required String hintText,
  })  : _passwordConstroller = passwordConstroller,
        _hintText = hintText,
        super(key: key);

  final TextEditingController _passwordConstroller;
  final String _hintText;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordConstroller,
      obscureText: isVisible,
      decoration: InputDecoration(
          labelText: widget._hintText,
          labelStyle: TextStyle(
            fontSize: Constants.disTextSize,
            color: Constants.color90,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Constants.inputBorderColor,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () => setState(() {
              isVisible != isVisible;
            }),
            child: isVisible
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.visibility_off_outlined),
          )),
    );
  }
}
