import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:complete_recorder/App Pages/record_list.dart';

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

class DataSearch extends SearchDelegate<RecordList> {
  final Stream<UnmodifiableListView<RecordList>> recordings;

  DataSearch(this.recordings);

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
    return Container();
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: show previous search
    return StreamBuilder<UnmodifiableListView<RecordList>>(
      stream: recordings,
      // ignore: missing_return
      builder:
          (context, AsyncSnapshot<UnmodifiableListView<RecordList>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              'No data!',
              // ignore: missing_return
            ),
          );
        }
        final results =
            snapshot.data.where((a) => a.title.toLowerCase().contains(query));
        return ListView(
          children: results.map<Widget>((a) => Text(a.title)).toList(),
        );
      },
    );
    //return Text(query);
    //return Container();
    /*final suggestionList = query.isEmpty ? recentRecordings : allRecordings;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.play_circle_fill_outlined),
        title: Text(suggestionList[index]),
      ),
    );
    //throw UnimplementedError();
  }*/
  }
}
