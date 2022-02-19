import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/size_config.dart';

import '../../screens/presentations/about_page.dart/components/plus_minus_item.dart';
import 'constants.dart';

class A_Cart extends StatelessWidget {
  const A_Cart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(100),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getHeight(100),
            width: getHeight(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/minimalstand.png"),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Minimal Stand",
                style: TextStyle(
                    color: const Color(0xff999999),
                    fontWeight: Constants.semiBold),
              ),
              Text(
                "\$ 25.00",
                style: TextStyle(
                  fontWeight: Constants.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: getHeight(30),
                width: getWidth(113),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const PlusMinusItem(icon: Icon(Icons.add)),
                    ),
                    const Text(
                      "1",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const PlusMinusItem(
                        icon: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),
    );
  }
}
