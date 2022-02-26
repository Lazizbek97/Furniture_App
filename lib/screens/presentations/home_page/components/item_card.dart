import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/furniture_model.dart';
import '../../../../core/utils/size_config.dart';

import '../../../../core/widgets/barbutton.dart';
import '../../../providers/home_page_provider/homepage_provider.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    List<FurnitureModel> mebels =
        context.watch<Box<FurnitureModel>>().values.toList();
    HomePageProvider home = context.watch<HomePageProvider>();

    Item item = mebels[home.menuIndex].items![index];

    Box<Item> cartItems =
        Provider.of<CartProvider>(context, listen: true).cartItems;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(10)),
      width: getWidth(157),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, "/about_page", arguments: index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 8,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(item.img![0].toString()),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () async {
                          if (cartItems.containsKey(item.name)) {
                            await context
                                .read<CartProvider>()
                                .deleteFromCartPage(item.name!);
                          } else {
                            await context
                                .read<CartProvider>()
                                .addCartPage(item, item.name!);
                          }
                        },
                        child: cartItems.containsKey(item.name)
                            ? BagButton(
                                color: Colors.yellow,
                              )
                            : BagButton(color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toString(),
                  ),
                  Text(
                    "\$ ${item.price}",
                    style: TextStyle(
                        color: Constants.color30, fontWeight: Constants.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
