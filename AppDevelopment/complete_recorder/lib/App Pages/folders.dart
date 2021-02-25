import 'package:flutter/material.dart';
import 'package:complete_recorder/homepage.dart';

class Folders extends StatefulWidget {
  @override
  _FoldersState createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  @override
  Widget build(BuildContext context) {
    //ROW 3; SAFE AREA, CONTAINER WITH BORDER THAT CONTAIN FILES
    return SafeArea(
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
                  icon: PopupMenuButton(
                      itemBuilder: (BuildContext bc) => [
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Rename  "),
                              Icon(Icons.drive_file_rename_outline),
                            ]
                        ),
                        ),
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Delete  "),
                              Icon(Icons.delete_forever_rounded),
                            ]
                        ),
                        ),
                      ],
                      child: Icon(Icons.folder_rounded)
                  ),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
                IconButton(
                  icon: PopupMenuButton(
                      itemBuilder: (BuildContext bc) => [
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Rename  "),
                              Icon(Icons.drive_file_rename_outline),
                            ]
                        ),
                        ),
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Delete  "),
                              Icon(Icons.delete_forever_rounded),
                            ]
                        ),
                        ),
                      ],
                      child: Icon(Icons.folder_rounded)
                  ),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                ),
                IconButton(
                  icon: PopupMenuButton(
                      itemBuilder: (BuildContext bc) => [
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Rename  "),
                              Icon(Icons.drive_file_rename_outline),
                            ]
                        ),
                        ),
                        PopupMenuItem(child:
                        Row(
                            children: <Widget>[
                              Text("Delete  "),
                              Icon(Icons.delete_forever_rounded),
                            ]
                        ),
                        ),
                      ],
                      child: Icon(Icons.folder_rounded)),
                  iconSize: 80.0,
                  color: Colors.blue[500],
                  //highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
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
      ),
    );

  }
}
