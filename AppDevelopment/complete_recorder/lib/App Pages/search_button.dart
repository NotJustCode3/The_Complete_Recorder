import 'package:complete_recorder/App%20Pages/recorded_list_view.dart';
import 'package:flutter/material.dart';
import 'package:complete_recorder/homepage.dart';
import 'package:complete_recorder/App Pages/search_brain.dart';
import 'package:complete_recorder/App Pages/record_list.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecordList()));
      },
      child: Card(
        //creating a child relationship with the safe area to include our card widget
        //card widget properties
        elevation: 3.0, //this gives it a slight drop shadow effect
        color: Colors.grey.withOpacity(0.3),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        //creating another child to draw elements onto the card widget
        child: ListTile(
          title: Text(
            'Search',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Roboto', letterSpacing: 0.5),
          ),
        ),
      ),
    );
  }
}
