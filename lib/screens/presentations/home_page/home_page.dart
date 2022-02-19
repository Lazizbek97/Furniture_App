import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/item_card.dart';
import 'components/menu_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Constants.searchImage,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Make home",
                          style: GoogleFonts.gelasio(
                            fontSize: 18,
                            color: Constants.color90,
                          ),
                        ),
                        Text(
                          "BEAUTIFUL",
                          style: GoogleFonts.gelasio(
                            fontSize: 18,
                            fontWeight: Constants.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, "/cart_page"),
                      icon: SvgPicture.asset(
                        Constants.cartImage,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(78),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: ((context, index) => const MenuButtons()),
                ),
              ),
              SizedBox(height: getHeight(10)),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 273,
                    mainAxisSpacing: getWidth(20),
                  ),
                  itemBuilder: (__, _) => const ItemCard(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/images/home.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/images/bookmark.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/images/bell.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/images/person.svg"),
            ),
          ]),
    );
  }
}
