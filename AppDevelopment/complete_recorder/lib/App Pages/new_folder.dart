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
      body: ExpansionTile(title: Text("New Recording", style: TextStyle(fontFamily: "Roboto", fontSize: 15.0,),),
        subtitle: Text(
            "2021-03-24 02:58:56 PM"),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                key: Key('play_button'),
                //onPressed: (),
                iconSize: 64.0,
                icon: Icon(Icons.play_arrow),
                color: Colors.cyan,
              ),
              IconButton(
                key: Key('pause_button'),
                //onPressed: (),
                iconSize: 64.0,
                icon: Icon(Icons.pause),
                color: Colors.cyan,
              ),
              IconButton(
                key: Key('stop_button'),
                //onPressed: _isPlaying || _isPaused ? () => _stop() : null,
                iconSize: 64.0,
                icon: Icon(Icons.stop),
                color: Colors.cyan,
              ),
              IconButton(
                //onPressed: _earpieceOrSpeakersToggle,
                iconSize: 64.0,
                icon:
                    Icon(Icons.volume_up),
                color: Colors.cyan,
              ),
            ],
          ),
        ],
    ));
  }
}