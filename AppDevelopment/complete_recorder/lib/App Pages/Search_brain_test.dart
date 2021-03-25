import 'package:flutter/material.dart';

class SearchBrain extends StatefulWidget {
  @override
  _SearchBrainState createState() => _SearchBrainState();
}

class _SearchBrainState extends State<SearchBrain> {
  static const historyLength = 3;
  List<String> _searchHistory = [];
  List<String> filteredSeacrhHistory;
  String selectedTerm;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
