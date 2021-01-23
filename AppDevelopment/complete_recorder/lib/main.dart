import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.white, //the background color of the scaffold is white
      body: SafeArea(
        //creating a sfe area to start drawing elements on to the scaffold widget
        child: Column(
          children: [
            Card(
              //creating a child relationship with the safe area to include our card widget
              //card widget properties
              elevation: 3.0, //this gives it a slight drop shadow effect
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              //creating another child to draw elements onto the card widget
              child: ListTile(
                //this widget houses the elements inside the card widget
                leading: Icon(Icons.menu,
                    color: Colors
                        .grey), //the leading property takes care of the elements to the left of the card
                //a simple text widget to write and style our text
                title: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                trailing: Icon(Icons
                    .create_new_folder_outlined), //the trailing property takes care of elements to the right of the card
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 30,
                  child: RaisedButton(
                    child: Text('Enabled Button 1',
                        overflow: TextOverflow.ellipsis),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPage()));
                      },
                  ),
                ),
                Container(
                  width: 100,
                  height: 30,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Enabled Button 2',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Container(
                  width: 100,
                  height: 30,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Enabled Button 3',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.orange[200],
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.orange[200],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.orange[200],
                    ),
                    Container(
                      width: 100.0,
                      height: 100.0,
                      color: Colors.orange[200],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}