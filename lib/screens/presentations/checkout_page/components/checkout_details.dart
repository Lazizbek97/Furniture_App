import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class CheckoutDetails extends StatelessWidget {
  CheckoutDetails({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              color: Constants.color80,
              fontWeight: Constants.regular),
        ),
        Text(
          "\$ $price",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
