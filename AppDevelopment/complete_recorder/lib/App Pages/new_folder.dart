import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final String value;

  NewPage({Key key, this.value}) : super(key: key);

  @override
  _NewPageState createState() => new _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Favorites"),
      ),
      body: new Text("RECORDING #", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold, fontSize: 20.0),),
    );
  }
}