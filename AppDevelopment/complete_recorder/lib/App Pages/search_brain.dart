import 'package:flutter/material.dart';

final allRecordings = [
  "New Recording 1",
  "New Recording 2",
  "New Recording 3",
  "New Recording 4",
];

final recentRecordings = [
  "New Recording 6",
  "New Recording 1",
];

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: show result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: show previous search
    final suggestionList = query.isEmpty ? recentRecordings : allRecordings;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.play_circle_fill_outlined),
        title: Text(suggestionList[index]),
      ),
    );
    //throw UnimplementedError();
  }
}
