import 'package:flutter/material.dart';
import 'package:furniture_app/screens/presentations/my_orders_page/components/canceled_cards.dart';
import 'package:furniture_app/screens/presentations/my_orders_page/components/processing_cards.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import 'components/delivered_cards.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final PageController _pageController = PageController();
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My order",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _controller,
            labelColor: Colors.black,
            unselectedLabelColor: Constants.color90,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 18,
            ),
            tabs: const [
              Tab(
                child: Text("Delivered"),
              ),
              Tab(
                child: Text("Processing"),
              ),
              Tab(
                child: Text("Cancel"),
              ),
            ],
            onTap: (value) => setState(() {
              _pageController.jumpToPage(value);
            }),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (v) {
                setState(() {
                  _controller.index = v;
                });
              },
              children: const [
                DeliveredCards(),
                ProcessingCards(),
                CanceledCards()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
