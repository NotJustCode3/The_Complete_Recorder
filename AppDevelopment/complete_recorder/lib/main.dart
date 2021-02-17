import 'package:complete_recorder/App%20Pages/recording_page.dart';
import 'package:complete_recorder/App%20Pages/test_recording.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}


//PAGE 2 - LIBRARY, FOLDERS, ETC...
class Homepage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Accessing the home of the material widget and drawing the scaffold onto it
      home: Scaffold(
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
                  leading: IconButton(
                      icon: Icon(Icons.menu),
                      //iconSize: 30.0,
                      color: Colors.grey,
                      //highlightColor: Colors.grey,
                      onPressed: () {

                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.5),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.create_new_folder_outlined),
                    //iconSize: 30.0,
                    color: Colors.grey,
                    //highlightColor: Colors.grey,
                    onPressed: () {
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => Folder()));
                    },
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
                    color: Colors.white,
                    highlightColor: Colors.red,
                    child: Text(
                      'Feature 1',
                      style: TextStyle(
                          color: Colors.black,
                          //fontSize: 20.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    highlightColor: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white, width: 2.0)),
                    child: Text(
                      'Feature 2',
                      style: TextStyle(
                          color: Colors.black,
                          //fontSize: 20.0,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.white,
                    highlightColor: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white, width: 2.0)),
                    child: Text(
                      'Feature 3',
                      style: TextStyle(
                          color: Colors.black,
                          //fontSize: 20.0,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ],
              ),

              // LINE DIVIDER
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: const Divider(
                  color: Colors.grey,
                ),
              ),

              //Row 2 'Most recent'
              Padding(
                padding: const EdgeInsets.fromLTRB(21, 1, 1, 1),
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Most Recent',
                      style: TextStyle(
                        letterSpacing: 0.5,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              //ROW 3; SAFE AREA, CONTAINER WITH BORDER THAT CONTAIN FILES
              SafeArea(
                  child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.grey),
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                    right: BorderSide(width: 1.0, color: Colors.grey),
                    left: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.folder_rounded),
                          iconSize: 80.0,
                          color: Colors.blue[500],
                          //highlightColor: Colors.grey,
                          splashColor: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.folder_rounded),
                          iconSize: 80.0,
                          color: Colors.blue[500],
                          //highlightColor: Colors.grey,
                          splashColor: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.folder_rounded),
                          iconSize: 80.0,
                          color: Colors.blue[500],
                          //highlightColor: Colors.grey,
                          splashColor: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          },
                        ),
                      ],
                    ),
                    //TEXT LABEL
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Choir!',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'School',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Anything',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ],
                ),
              )),

              //ROW 4: RECORDING BUTTON THAT RECORDS
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Center(
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )
                          //shape: CircleBorder(),
                          ),
                      child: IconButton(
                        icon: Icon(Icons.fiber_manual_record),
                        iconSize: 70.0,
                        color: Colors.red,
                        highlightColor: Colors.grey,
                        //splashColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestRecording()));
                        },
                      ),
                    ),
                  ),
                ),

          ),
        ),

      ),
    );
  }
}
