import 'package:flutter/material.dart';
import 'package:complete_recorder/homepage.dart';
import 'package:complete_recorder/App Pages/search_brain.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[700],
      //creating a child relationship with the safe area to include our card widget
      //card widget properties
      elevation: 3.0, //this gives it a slight drop shadow effect
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      //creating another child to draw elements onto the card widget
      child: ListTile(
        //this widget houses the elements inside the card widget
        leading: IconButton(
            icon: Icon(Icons.menu),
            //iconSize: 30.0,
            color: Colors.grey,
            //highlightColor: Colors.grey,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
        title: Text(
          'Search',
          style: TextStyle(
              color: Colors.grey, fontFamily: 'Roboto', letterSpacing: 0.5),
        ),
        trailing: IconButton(
          icon: Icon(Icons.create_new_folder_outlined),
          //iconSize: 30.0,
          color: Colors.grey,
          //highlightColor: Colors.grey,
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
            //Navigator.push(context,MaterialPageRoute(builder: (context) => Folder()));
          },
        ),
      ),
    );
  }
}
