import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Accessing the home of the material widget and drawing the scaffold onto it
      home: Scaffold(
        backgroundColor:
            Colors.black, //the background color of the scaffold is white
        body: SafeArea(
            //creating a sfe area to start drawing elements on to the scaffold widget
            child: Column(children: [
          Card(
            //creating a child relationship with the safe area to include our card widget
            //card widget properties
            elevation: 3.0, //this gives it a slight drop shadow effect
            color: Colors.grey[600],
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            //creating another child to draw elements onto the card widget
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.white),
                  bottom: BorderSide(width: 2.0, color: Colors.white),
                  right: BorderSide(width: 2.0, color: Colors.white),
                  left: BorderSide(width: 2.0, color: Colors.white),
                ),
              ),
              child: ListTile(
                //this widget houses the elements inside the card widget
                leading: Icon(Icons.menu,
                    color: Colors
                        .white), //the leading property takes care of the elements to the left of the card
                //a simple text widget to write and style our text
                title: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                trailing: Icon(Icons.create_new_folder_outlined,
                    size: 30.0,
                    color: Colors
                        .white), //the trailing property takes care of elements to the right of the card
              ),
            ),
          ),

          // ROW 1 FEATURES BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white, width: 2.0)),
                color: Colors.black,
                highlightColor: Colors.red,
                child: Text(
                  'Feature 1'
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      //fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.black,
                highlightColor: Colors.red,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white, width: 2.0)),
                child: Text(
                  'Feature 2',
                  style: TextStyle(
                      color: Colors.white,
                      //fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.black,
                highlightColor: Colors.red,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white, width: 2.0)),
                child: Text(
                  'Extras',
                  style: TextStyle(
                      color: Colors.white,
                      //fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ],
          ),

          // LINE DIVIDER
          const Divider(
            color: Colors.redAccent,
            height: 20,
            thickness: 3,
            indent: 25,
            endIndent: 25,
          ),

          //ROW 2 MORE FEATURES BUTTONS ('ex: MORE RECENT, ETC...')
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.black,
                  highlightColor: Colors.red,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white, width: 2.0)),
                  child: Text(
                    'Extras',
                    style: TextStyle(
                        color: Colors.white,
                        //fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
              ),
            ],
          ),

          //ROW 3; SAFE AREA, CONTAINER WITH BORDER THAT CONTAIN FILES
          SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3.0, color: Colors.green),
                  bottom: BorderSide(width: 3.0, color: Colors.yellow),
                  right: BorderSide(width: 3.0, color: Colors.blue),
                  left: BorderSide(width: 3.0, color: Colors.redAccent),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      //Text('Folder', style: TextStyle(color: Colors.white),),
                      Icon(Icons.folder_rounded, color: Colors.blue[500], size: 100.0,),
                      Icon(Icons.folder_open_rounded, color: Colors.blue[500], size: 100.0,),
                      Icon(Icons.folder_shared_rounded, color: Colors.blue[500], size: 100.0,)
                    ],
                  ),
                  //TEXT LABEL
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        Text('Folder 1', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 2', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 3', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      //Text('Folder', style: TextStyle(color: Colors.white),),
                      Icon(Icons.folder_rounded, color: Colors.orange[200], size: 100.0,),
                      Icon(Icons.create_new_folder_outlined, color: Colors.orange[200], size: 100.0,),
                      Icon(Icons.folder_sharp, color: Colors.orange[200], size: 100.0,)
                    ],
                  ),
                  //TEXT LABEL
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        Text('Folder 4', style: TextStyle(color: Colors.blue[200], fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 5', style: TextStyle(color: Colors.blue[200], fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 6', style: TextStyle(color: Colors.blue[200], fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget> [
                      //Text('Folder', style: TextStyle(color: Colors.white),),
                      Icon(Icons.folder_special_rounded, color: Colors.white70, size: 100.0,),
                      Icon(Icons.folder_open_rounded, color: Colors.white70, size: 100.0,),
                      Icon(Icons.create_new_folder_rounded, color: Colors.white70, size: 100.0,)
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        Text('Folder 7', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 8', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                        Text('Folder 9', style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold),),
                      ]
                  ),
                ],
              ),
            )
          ),

          //ROW 4: RECORDING BUTTON THAT RECORDS
          Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Center(
              child: Ink(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    )
                    //shape: CircleBorder(),
                    ),
                child: IconButton(
                  icon: Icon(Icons.mic),
                  iconSize: 35.0,
                  color: Colors.white,
                  highlightColor: Colors.grey,
                  //splashColor: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}


class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
    );
  }
}