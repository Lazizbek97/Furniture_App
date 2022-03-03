import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/barbutton.dart';
import '../../providers/cart_provider/cart_provider.dart';

class SearchPage extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: getHeight(200),
      width: getHeight(160),
      child: SizedBox(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Item> suggestionsList = [];
    Box<Item> cartItems =
        Provider.of<CartProvider>(context, listen: true).cartItems;

    var FMList = context.watch<Box<FurnitureModel>>().values.toList();
    for (var item in FMList) {
      for (var i in item.items!) {
        suggestionsList.add(i);
      }
    }

    var suggestions = suggestionsList.where((element) {
      final result = element.name!.toLowerCase().toString();
      final input = query.toLowerCase().toString();
      return result.contains(input);
    }).toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(15), vertical: getHeight(10)),
      child: ListView.separated(
        itemCount: suggestions.length,
        separatorBuilder: (c, i) => Divider(
          color: Constants.dividerColor,
        ),
        itemBuilder: (__, _) => InkWell(
          onTap: () => Navigator.pushNamed(context, "/details_search_result", arguments: suggestions[_]),
          child: Container(
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
                          image: AssetImage(suggestions[_].img![0].toString()),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suggestions[_].name.toString(),
                          style: TextStyle(
                              color: const Color(0xff999999),
                              fontWeight: Constants.semiBold),
                        ),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        Text(
                          "\$ ${suggestions[_].price}",
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
                    InkWell(
                      onTap: () async {
                        if (cartItems.containsKey(suggestions[_].name)) {
                          await context
                              .read<CartProvider>()
                              .deleteFromCartPage(suggestions[_].name!);
                        } else {
                          await context
                              .read<CartProvider>()
                              .addCartPage(suggestions[_], suggestions[_].name!);
                        }
                      },
                      child: cartItems.containsKey(suggestions[_].name.toString())
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
        ),
      ),
    );
    ;
  }
}

//  ListView.builder(
//         itemCount: suggestions.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             onTap: () {
//               query = suggestions[index];

//               showResults(context);
//             },
//             title: Text(suggestions[index]),
//           );
//         });
