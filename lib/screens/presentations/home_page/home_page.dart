import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/presentations/account_page/account_page.dart';
import 'package:furniture_app/screens/presentations/favorites_page/favorites.dart';
import 'package:furniture_app/screens/presentations/notifications_page/notifications_page.dart';
import 'package:furniture_app/screens/presentations/search_page/search_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../providers/cart_provider/cart_provider.dart';
import '../../providers/home_page_provider/homepage_provider.dart';
import 'components/item_card.dart';
import 'components/menu_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _navbarIndex = 0;

  final List _pages = [
    const HomePageBody(),
    const FavoritesPage(),
    const NotificationsPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _pages[_navbarIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _navbarIndex,
          onTap: (v) async {
            setState(() {
              _navbarIndex = v;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                _navbarIndex != 0
                    ? "assets/images/home.svg"
                    : "assets/images/home_filled.svg",
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                _navbarIndex != 1
                    ? "assets/images/bookmark.svg"
                    : "assets/images/bookmark_filled.svg",
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                _navbarIndex != 2
                    ? "assets/images/bell.svg"
                    : "assets/images/bell_filled.svg",
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                _navbarIndex != 3
                    ? "assets/images/person.svg"
                    : "assets/images/person_filled.svg",
              ),
            ),
          ]),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mebels = context.watch<Box<FurnitureModel>>().values;
    var home = context.watch<HomePageProvider>();
    print(mebels.isEmpty);

    return SafeArea(
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
            ),
            SizedBox(
              height: getHeight(78),
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mebels.isNotEmpty ? mebels.length : 5,
                itemBuilder: ((context, index) => mebels.isEmpty
                    ? const Center(
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      )
                    : InkWell(
                        onTap: () => home.changeMenu(index),
                        child: MenuButtons(
                          index: index,
                        ),
                      )),
              ),
            ),
            SizedBox(height: getHeight(10)),
            Expanded(
              child: GridView.builder(
                itemCount: mebels.isNotEmpty
                    ? mebels.toList()[home.menuIndex].items!.length
                    : 5,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 273,
                  mainAxisSpacing: getWidth(20),
                ),
                itemBuilder: (__, _) => mebels.isNotEmpty
                    ? ItemCard(index: _)
                    : const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
