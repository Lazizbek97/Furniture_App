import 'package:flutter/material.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/color_picker_provider/color_picker_provider.dart';
import 'package:furniture_app/screens/providers/isfavorite_provider/is_favorite_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../providers/cart_provider/cart_provider.dart';
import '../../providers/home_page_provider/homepage_provider.dart';
import 'components/bookmark_part.dart';
import 'components/color_picker.dart';
import 'components/plus_minus_item.dart';
import 'components/ratings_part.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key, required this.index}) : super(key: key);

  int index;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var home = context.watch<HomePageProvider>();
    var mebels = context
        .watch<Box<FurnitureModel>>()
        .values
        .toList()[home.menuIndex]
        .items![index];

    Box<Item> favorites =
        Provider.of<IsFavoriteProvider>(context, listen: true).favorites;
    return WillPopScope(
      onWillPop: () async {
        final cartItemsss = Boxes.getCartItems();
        if (!cartItemsss.containsKey(mebels.name)) {
          mebels.count = 1;
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: getHeight(455),
                    width: getWidth(323),
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: mebels.img!.length,
                      itemBuilder: ((context, i) => Hero(
                            tag: "mebel${home.menuIndex}$index",
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(mebels.img![i].toString()),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  top: getHeight(53),
                  left: getWidth(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          final cartItemsss = Boxes.getCartItems();
                          if (!cartItemsss.containsKey(mebels.name)) {
                            mebels.count = 1;
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: getHeight(40),
                          width: getHeight(40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10, color: Colors.grey.shade300)
                              ]),
                          child: const Icon(Icons.keyboard_arrow_left_outlined),
                        ),
                      ),
                      Container(
                        height: getHeight(192),
                        width: getWidth(64),
                        margin: EdgeInsets.only(top: getHeight(96)),
                        child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, i) {
                            return SizedBox(
                              height: getHeight(15.0),
                            );
                          },
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                context.read<ColorPicker>().changeColor(index);
                              },
                              child: ColorChekcer(
                                child:
                                    context.watch<ColorPicker>().colorIndex ==
                                            index
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.black,
                                          )
                                        : const Text(""),
                                color: index == 0
                                    ? Colors.white
                                    : index == 1
                                        ? const Color(0xffB4916C)
                                        : const Color(0xffE4CBAD),
                              ),
                            );
                          }),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey.shade300,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: getHeight(20),
                  right: getWidth(100),
                  child: mebels.img!.length != 1
                      ? SmoothPageIndicator(
                          controller: _controller,
                          // PageController
                          count: mebels.img!.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.black,
                            dotColor: Colors.white,
                            dotHeight: getHeight(6.0),
                          ), // your preferred effect
                          onDotClicked: (index) {})
                      : Text(""),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: getHeight(126),
                    width: getWidth(325),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              mebels.name.toString(),
                              style: GoogleFonts.gelasio(
                                fontSize: getHeight(24),
                              ),
                            ),
                            Text(
                              "\$ ${mebels.price}",
                              style: TextStyle(
                                  fontSize: getHeight(30),
                                  fontWeight: Constants.bold),
                            ),
                            RatingsPart(mebels: mebels, index: index)
                          ],
                        ),
                        Consumer<CartProvider>(
                          builder: ((context, cartItems, child) {
                            final cartItems = context.watch<CartProvider>();

                            return SizedBox(
                              height: getHeight(30),
                              width: getWidth(113),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cartItems.addCount(mebels);
                                    },
                                    child: const PlusMinusItem(
                                        icon: Icon(Icons.add)),
                                  ),
                                  Text(
                                    mebels.count.toString(),
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cartItems.removeCount(mebels);
                                    },
                                    child: const PlusMinusItem(
                                      icon: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(100),
                    width: getWidth(325),
                    child: Text(
                      mebels.disc.toString(),
                      style: TextStyle(
                          color: Constants.color60,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(60),
                    width: getWidth(325),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (Provider.of<IsFavoriteProvider>(context,
                                    listen: false)
                                .favorites
                                .containsKey(mebels.name)) {
                              await context
                                  .read<IsFavoriteProvider>()
                                  .deleteFromFavorites(mebels.name!);
                            } else {
                              await context
                                  .read<IsFavoriteProvider>()
                                  .addFavorites(mebels, mebels.name!);
                            }
                          },
                          child: BookmarkPart(
                              favorites: favorites, mebels: mebels),
                        ),
                        SizedBox(
                          height: getHeight(60),
                          width: getWidth(250),
                          child: ElevatedButton(
                            onPressed: () async {
                              final cartItemsss = Boxes.getCartItems();

                              if (cartItemsss.containsKey(mebels.name)) {
                                await cartItemsss.put(mebels.name, mebels);
                              } else {
                                await context
                                    .read<CartProvider>()
                                    .addCartPage(mebels, mebels.name!);
                              }

                              context.read<CartProvider>().totalSum();
                              Navigator.pushReplacementNamed(
                                  context, "/cart_page");
                            },
                            child: const Text("Add to cart"),
                          ),
                        )
                      ],
                    ),
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
