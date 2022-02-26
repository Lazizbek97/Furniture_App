import 'package:flutter/material.dart';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../about_page.dart/components/plus_minus_item.dart';
import '../../../../core/utils/constants.dart';

class A_Cart extends StatelessWidget {
  const A_Cart({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Item model;

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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(model.img![0].toString()),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name.toString(),
                style: TextStyle(
                    color: const Color(0xff999999),
                    fontWeight: Constants.semiBold),
              ),
              Text(
                "\$ ${model.price}",
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
                      onTap: () {
                        context.read<CartProvider>().addCount(model);
                        context.read<CartProvider>().totalSum();
                      },
                      child: const PlusMinusItem(icon: Icon(Icons.add)),
                    ),
                    Text(
                      model.count.toString(),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<CartProvider>().removeCount(model);
                        context.read<CartProvider>().totalSum();
                      },
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
              onPressed: () {
                model.count = 1;
                context
                    .read<CartProvider>()
                    .deleteFromCartPage(model.name.toString());
                context.read<CartProvider>().totalSum();
              },
              icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),
    );
  }
}
