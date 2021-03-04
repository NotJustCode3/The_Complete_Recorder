import 'package:flutter/material.dart';
import 'package:complete_recorder/App Pages/record_list.dart';

class FeatureButton extends StatefulWidget {
  @override
  _FeatureButtonState createState() => _FeatureButtonState();
}

class _FeatureButtonState extends State<FeatureButton> {
  @override
  Widget build(BuildContext context) {
    //Row 1 FEATURE BUTTONS
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordList()));
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xFF8D8E98), width: 2.0)),
            color: Color(0xFF8D8E98),
            highlightColor: Colors.red,
            child: Text(
              'All recordings',
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
            color: Color(0xFF8D8E98),
            highlightColor: Colors.red,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xFF8D8E98), width: 2.0)),
            child: Text(
              'Folders',
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
            color: Color(0xFF8D8E98),
            highlightColor: Colors.red,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xFF8D8E98), width: 2.0)),
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
      );
  }
}
