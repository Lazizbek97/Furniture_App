import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/widgets/barbutton.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../providers/isfavorite_provider/is_favorite_provider.dart';
import '../search_page/search_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box<Item> cartItems =
        Provider.of<CartProvider>(context, listen: true).cartItems;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await showSearch(
              context: context,
              delegate: SearchPage(),
              query: "search...",
            );
          },
          icon: SvgPicture.asset(
            Constants.searchImage,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartProvider>().totalSum();

              Navigator.pushNamed(context, "/cart_page");
            },
            icon: SvgPicture.asset(
              Constants.cartImage,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<IsFavoriteProvider>(
          builder: ((context, favoritesItemsBox, child) {
            final favoritesItemsBox =
                context.watch<IsFavoriteProvider>().favorites.values.toList();

            return favoritesItemsBox.isEmpty
                ? const Center(
                    child: Text("There is not any favorite furnitures yet"),
                  )
                : ListView.separated(
                    itemCount: favoritesItemsBox.length,
                    separatorBuilder: (c, i) => Divider(
                      color: Constants.dividerColor,
                    ),
                    itemBuilder: (__, _) => Container(
                      height: getHeight(100),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: getHeight(100),
                                width: getHeight(100),
                                margin: EdgeInsets.only(right: getWidth(20)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(favoritesItemsBox[_]
                                        .img![0]
                                        .toString()),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favoritesItemsBox[_].name.toString(),
                                    style: TextStyle(
                                        color: const Color(0xff999999),
                                        fontWeight: Constants.semiBold),
                                  ),
                                  SizedBox(
                                    height: getHeight(10),
                                  ),
                                  Text(
                                    "\$ ${favoritesItemsBox[_].price}",
                                    style: TextStyle(
                                      fontWeight: Constants.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => context
                                    .read<IsFavoriteProvider>()
                                    .deleteFromFavorites(
                                        favoritesItemsBox[_].name.toString()),
                                icon:
                                    const Icon(Icons.highlight_remove_outlined),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (cartItems
                                      .containsKey(favoritesItemsBox[_].name)) {
                                    await context
                                        .read<CartProvider>()
                                        .deleteFromCartPage(
                                            favoritesItemsBox[_].name!);
                                  } else {
                                    await context
                                        .read<CartProvider>()
                                        .addCartPage(favoritesItemsBox[_],
                                            favoritesItemsBox[_].name!);
                                  }
                                },
                                child: cartItems.containsKey(
                                        favoritesItemsBox[_].name.toString())
                                    ? BagButton(
                                        color: Colors.yellow,
                                      )
                                    : BagButton(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
          
          }),
        ),
      ),
      floatingActionButton: SizedBox(
        height: getHeight(50),
        width: getWidth(334),
        child: FloatingActionButton(
          onPressed: () async {
            final favoritesItemsBox =
                Provider.of<IsFavoriteProvider>(context, listen: false)
                    .favorites
                    .values
                    .toList();
            for (var item in favoritesItemsBox) {
              await context
                  .read<CartProvider>()
                  .addCartPage(item, item.name.toString());
            }
          },
          child: const Text("Add all to my cart"),
          isExtended: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
