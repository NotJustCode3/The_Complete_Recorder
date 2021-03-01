import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'demo/demo.dart';
import 'simple_playback/simple_playback.dart';
import 'simple_recorder/simple_recorder.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}


// //HOMEPAGE - RECORD & LIBRARY
// class Homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //Accessing the home of the material widget and drawing the scaffold onto it
//       home: Scaffold(
//         backgroundColor:
//             Colors.black, //the background color of the scaffold is white
//         appBar: AppBar(
//           backgroundColor: Colors.pink[900], //grey[600],
//           centerTitle: true,
//           title: Text(
//             'THE COMPLETE RECORDER',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 23.0,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Roboto',
//               letterSpacing: 0.5,
//             ),
//           ),
//         ),
//         body: SafeArea(
//           //creating a sfe area to start drawing elements on to the scaffold widget
//           child: Column(children: [
//             //ROW 1: GO TO RECORD PAGE
//             Container(
//               margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
//               child: Container(
//                 margin: EdgeInsets.only(top: 80.0, bottom: 50.0),
//                 child: Center(
//                   child: Ink(
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(100),
//                         border: Border.all(
//                           width: 5,
//                           color: Colors.white,
//                         )),
//                     child: IconButton(
//                       icon: Icon(Icons.mic),
//                       iconSize: 100.0,
//                       color: Colors.white,
//                       highlightColor: Colors.grey,
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Record()));
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             const Divider(
//               color: Colors.redAccent,
//               height: 20,
//               thickness: 5,
//               indent: 20,
//               endIndent: 20,
//             ),
//
//             //ROW 2 - LIBRARY BUTTONS, GO FOR FILES
//             Container(
//               margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
//               child: Container(
//                 margin: EdgeInsets.only(top: 60.0, bottom: 50.0),
//                 child: Center(
//                   child: Ink(
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(100),
//                         border: Border.all(
//                           width: 5,
//                           color: Colors.white70,
//                         )),
//                     child: IconButton(
//                       icon: Icon(Icons.library_books),
//                       iconSize: 100.0,
//                       color: Colors.white,
//                       highlightColor: Colors.grey,
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Library()));
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

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
            child: Column(children: [
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Folder()));
                  }),
              title: Text(
                'Search',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Folder()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.folder_rounded),
                      iconSize: 80.0,
                      color: Colors.blue[500],
                      //highlightColor: Colors.grey,
                      splashColor: Colors.grey,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Folder()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.folder_rounded),
                      iconSize: 80.0,
                      color: Colors.blue[500],
                      //highlightColor: Colors.grey,
                      splashColor: Colors.grey,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Folder()));
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
            padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ExamplesApp()));
                    },
                  ),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

//PAGE 3 - RECORDING (1 of 2)
class Record extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

//PAGE 3 - RECORDING (2 of 2)
class _RecordPageState extends State<Record>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Studio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.grey[600],
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animationController,
              color: Colors.redAccent,
            ),
            iconSize: 200,
            splashColor: Colors.redAccent,
            onPressed: () => _handleOnPressed(),
          ),
        ),
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}

//PAGE 4 - FOLDER PAGE (APP SKETCHES)
class Folder extends StatelessWidget {
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
                leading: IconButton(
                  icon: Icon(Icons.home_rounded),
                  iconSize: 30.0,
                  color: Colors.white,
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                ),
                title: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.create_new_folder_outlined),
                  iconSize: 30.0,
                  color: Colors.white,
                  highlightColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                ),
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

          //ROW 3; SAFE AREA, CONTAINER WITH BORDER
          SafeArea(
              child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.only(bottom: 10.0),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 3.0, color: Colors.white),
                    ),
                  ),
                  child: Row(children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill_rounded),
                        iconSize: 80.0,
                        color: Colors.redAccent,
                        highlightColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Record()));
                        },
                      ),
                    ),
                    Text(
                      'Stomachache',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    Text('             '),
                    Text(
                      '5.09M   4:43',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 3.0, color: Colors.white),
                    ),
                  ),
                  child: Row(children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill_rounded),
                        iconSize: 80.0,
                        color: Colors.redAccent,
                        highlightColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Record()));
                        },
                      ),
                    ),
                    Text(
                      'Sorry Not Sorry',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    Text('         '),
                    Text(
                      '4.45M   4:43',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        //bottom: BorderSide(width: 3.0, color: Colors.white),
                        ),
                  ),
                  child: Row(children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill_rounded),
                        iconSize: 80.0,
                        color: Colors.redAccent,
                        highlightColor: Colors.grey,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Record()));
                        },
                      ),
                    ),
                    Text(
                      'Never Say Never',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                    Text('      '),
                    Text(
                      '5.09M   4:43',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5),
                    ),
                  ]),
                ),
              ],
            ),
          )),
        ])),
      ),
    );
  }
}


//PAGE 5 - RECORDING PAGE
class Recording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Recording"),
      ),
      body: SafeArea(
        //creating a sfe area to start drawing elements on to the scaffold widget
        child: Column(children: [
          RaisedButton(
            onPressed: () {Navigator.pop(context);},
            child: Text('Go back!'),
          ),

        ]),
      ),
    );
  }
}

//FLUTTER SOUND INSTANTIATION
const int tNotWeb = 1;

class Example {
  final String title;
  final String subTitle;
  final String description;
  final WidgetBuilder route;
  final int flags;

  /* ctor */ Example(
      {this.title, this.subTitle, this.description, this.flags, this.route});
  void go(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute<void>(builder: route));
}

final List<Example> exampleTable = [
  Example(
    title: 'Demo',
    subTitle: 'Flutter Sound capabilities',
    flags: 0,
    route: (_) => Demo(),
    description:
    '''This is a Demo of what it is possible to do with Flutter Sound.
The code of this Demo app is not so simple and unfortunately not very clean :-( .

Flutter Sound beginners : you probably should look to `[SimplePlayback]`  and `[SimpleRecorder]` 

The biggest interest of this Demo is that it shows most of the features of Flutter Sound :

- Plays from various media with various codecs
- Records to various media with various codecs
- Pause and Resume control from recording or playback
- Shows how to use a Stream for getting the playback (or recoding) events
- Shows how to specify a callback function when a playback is terminated,
- Shows how to record to a Stream or playback from a stream
- Can show controls on the iOS or Android lock-screen
- ...

This Demo does not make use of the Flutter Sound UI Widgets.

It would be really great if someone rewrite this demo soon'''),


  Example(
    title: 'simplePlayback',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimplePlayback(),
    description: '''
    This is a very simple example for Flutter Sound beginners,
    that shows how to play a remote file.
    ''',
  ),

  Example(
    title: 'simpleRecorder',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimpleRecorder(),
    description: '''
    This is a very simple example for Flutter Sound beginners,
    that shows how to record, and then playback a file.
    ''',
  ),
];

class ExamplesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sound Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamplesAppHomePage(title: 'Flutter Sound Examples'),
    );
  }
}

///
class ExamplesAppHomePage extends StatefulWidget {
  ///
  ExamplesAppHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ExamplesHomePageState createState() => _ExamplesHomePageState();
}

class _ExamplesHomePageState extends State<ExamplesAppHomePage> {
  Example selectedExample;

  @override
  void initState() {
    selectedExample = exampleTable[0];
    super.initState();
    //_scrollController = ScrollController( );
  }

  @override
  Widget build(BuildContext context) {
    Widget cardBuilder(BuildContext context, int index) {
      var isSelected = (exampleTable[index] == selectedExample);
      return GestureDetector(
        onTap: () => setState(() {
          selectedExample = exampleTable[index];
        }),
        child: Card(
          shape: RoundedRectangleBorder(),
          child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigo : Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),

            height: 50,

            //color: isSelected ? Colors.indigo : Colors.cyanAccent,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(exampleTable[index].title,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
              Text(exampleTable[index].subTitle,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
            ]),
          ),
          borderOnForeground: false,
          elevation: 3.0,
        ),
      );
    }

    Widget makeBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: ListView.builder(
                  itemCount: exampleTable.length, itemBuilder: cardBuilder),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: SingleChildScrollView(
                child: Text(selectedExample.description),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: makeBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text((kIsWeb && (selectedExample.flags & tNotWeb != 0))
                    ? 'Not supported on Flutter Web '
                    : ''),
                RaisedButton(
                  onPressed: (kIsWeb && (selectedExample.flags & tNotWeb != 0))
                      ? null
                      : () => selectedExample.go(context),
                  color: Colors.indigo,
                  child: Text(
                    'GO',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));},
                  child: Text('Homepage')
                ),
              ],
            )),
      ),
    );
  }
}