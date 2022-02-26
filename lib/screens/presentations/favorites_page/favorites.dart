import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:furniture_app/core/widgets/barbutton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/models/user_model.dart';
import '../../../core/services/favorites_page_service/cart_page_service/cart_page_service.dart';
import '../../../core/services/favorites_page_service/favorites_service.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
            onPressed: () => Navigator.pushNamed(context, "/cart_page"),
            icon: SvgPicture.asset(
              Constants.cartImage,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FavoritesPageService.userFavoriteStream,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
              if (snap.data == null ||
                  UserModel.fromJson(snap.data!.docs.first.data())
                      .favorites!
                      .isEmpty) {
                return const Center(
                  child: Text("There is not any favorite furnitures yet"),
                );
              }
              if (snap.hasError) {
                return const Center(
                  child: Text("Somthing went wrong!"),
                );
              }

              final favoritesItems =
                  UserModel.fromJson(snap.data!.docs.first.data())
                      .favorites!
                      .map((e) => Item.fromJson(e))
                      .toList();

              return ListView.separated(
                itemCount: favoritesItems.length,
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
                                image: AssetImage(
                                    favoritesItems[_].img![0].toString()),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoritesItems[_].name.toString(),
                                style: TextStyle(
                                    color: const Color(0xff999999),
                                    fontWeight: Constants.semiBold),
                              ),
                              SizedBox(
                                height: getHeight(10),
                              ),
                              Text(
                                "\$ ${favoritesItems[_].price}",
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
                            onPressed: () =>
                                FavoritesPageService.deleteFromFavorites(
                                    favoritesItems[_]),
                            icon: const Icon(Icons.highlight_remove_outlined),
                          ),
                          InkWell(
                            onTap: () => CartPageService.addItemToCard(
                                favoritesItems[_]),
                            child: const BagButton(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: SizedBox(
        height: getHeight(50),
        width: getWidth(334),
        child: FloatingActionButton(
          onPressed: () {},
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
