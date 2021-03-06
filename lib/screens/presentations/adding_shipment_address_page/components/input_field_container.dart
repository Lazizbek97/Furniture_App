import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class InputFieldAdress extends StatelessWidget {
  InputFieldAdress({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.backColor,
    required this.borderColor,
    this.ktype,
  }) : super(key: key);

  TextEditingController controller;
  String title;
  String hintText;
  Color backColor;
  Color borderColor;
  TextInputType? ktype;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(66),
      width: getWidth(335),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
        color: backColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff9B9B9B),
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: ktype,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              isDense: true,
              fillColor: backColor,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xff9B9B9B),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffF5F5F5))),
            ),
          )
        ],
      ),
    );
  }
}
