import 'package:complete_recorder/App%20Pages/speech_text.dart';
import 'package:flutter/material.dart';
import 'package:complete_recorder/App Pages/record_list.dart';
import 'package:complete_recorder/App Pages/folders.dart';

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
                context, MaterialPageRoute(builder: (context) => RecordList()));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white70, width: 2.0)),
          color: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.red,
          child: Text(
            'All recordings',
            style: TextStyle(
                color: Colors.white,
                //fontSize: 20.0,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                letterSpacing: 0.5),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Folders()));
          },
          color: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.red,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white70, width: 2.0)),
          child: Text(
            'Folders',
            style: TextStyle(
                color: Colors.white,
                //fontSize: 20.0,
                //fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                letterSpacing: 0.5),
          ),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SpeechText()));
          },
          color: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.red,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.white70, width: 2.0)),
          child: Text(
            'Speech',
            style: TextStyle(
                color: Colors.white,
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
