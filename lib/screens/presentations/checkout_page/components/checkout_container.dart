import 'package:flutter/material.dart';

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Widget child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 25.0)],
        ),
        child: child);
  }
}
