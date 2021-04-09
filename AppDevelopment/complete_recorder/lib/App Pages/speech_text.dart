import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechText extends StatefulWidget {
  @override
  _SpeechTextState createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  final Map<String, HighlightedWord> _highlights = {};

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press The Record Button When You Are Ready';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech To Text"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF111328),
            // gradient: LinearGradient(
            //   colors: [Colors.indigo[800], Colors.purple[800], Colors.indigo[800]],
            // ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 20000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5.0,
                  spreadRadius: 4.0,
                ),
              ]),
          child: RaisedButton(
            color: Colors.red[700],
            onPressed: _listen,
            shape: CircleBorder(
              //borderRadius: BorderRadius.circular(30),
              //side: BorderSide(color: Colors.white, width: 2.0)
            ),
            child: Container(
              width: 100,
              height: 100,
              child: Icon(
                _isListening ? Icons.stop : Icons.mic,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: TextHighlight(
            text: _text,
            words: _highlights,
            textStyle: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {}),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}