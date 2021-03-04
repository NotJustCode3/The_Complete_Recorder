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
            onPressed: () {},
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blueGrey[700], width: 2.0)),
            color: Colors.blueGrey[700],
            highlightColor: Colors.red,
            child: Text(
              'Feature 1',
              style: TextStyle(
                  color: Colors.orange,
                  //fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordList()));
            },
            color: Colors.blueGrey[700],
            highlightColor: Colors.red,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blueGrey[700], width: 2.0)),
            child: Text(
              'List',
              style: TextStyle(
                  color: Colors.orange,
                  //fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.blueGrey[700],
            highlightColor: Colors.red,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blueGrey[700], width: 2.0)),
            child: Text(
              'Feature 3',
              style: TextStyle(
                  color: Colors.orange,
                  //fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5),
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ],
      );
  }
}
