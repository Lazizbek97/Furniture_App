import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/widgets/barbutton.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (c,i)=>Divider(color: Constants.dividerColor,),
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/minimalstand.png"),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minimal Stand",
                          style: TextStyle(
                              color: const Color(0xff999999),
                              fontWeight: Constants.semiBold),
                        ),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        Text(
                          "\$ 25.00",
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
                      onPressed: () {},
                      icon: const Icon(Icons.highlight_remove_outlined),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const BagButton(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
