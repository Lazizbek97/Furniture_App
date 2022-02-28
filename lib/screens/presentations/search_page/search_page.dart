import 'package:flutter/material.dart';

import '../../../core/utils/size_config.dart';

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
    var suggestions = [].where((element) {
      final result = element.name!.toLowerCase().toString();
      final input = query.toLowerCase().toString();
      return result.contains(input);
    }).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              query = suggestions[index].name!;

              showResults(context);
            },
            title: Text(suggestions[index].name!),
          );
        });
  }
}
