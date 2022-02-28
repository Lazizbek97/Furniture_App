import 'package:flutter/material.dart';

class NoInternetConnectionPage extends StatelessWidget {
  const NoInternetConnectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xffF7F7F7),
          child: Center(
              child: Image.asset(
            "assets/images/nointernet.gif",
            fit: BoxFit.cover,
          ))),
    );
  }
}
