import 'package:flutter/material.dart';

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
      );
  }
}
