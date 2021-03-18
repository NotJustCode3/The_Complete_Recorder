// TODO Implement this library.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:complete_recorder/App Pages/record_list.dart';

import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:complete_recorder/App Pages/record_list.dart';

class RecordPage extends StatefulWidget {
  final Function onSaved;

  const RecordPage({Key key, @required this.onSaved}) : super(key: key);
  @override
  _RecordPageState createState() => _RecordPageState();
}

//checks on recording state
enum RecordingState {
  /// Recording not initialized
  UnSet,

  /// Ready for start recording
  Set,

  /// Currently recording
  Recording,

  /// This specific recording Stopped, cannot be start again
  Stopped,
}

class _RecordPageState extends State<RecordPage> {
  IconData _recordIcon = Icons.mic_none;
  String _recordText = 'Click to start';
  RecordingState _recordingState = RecordingState.UnSet;

  //Recorder Properties
  FlutterAudioRecorder audioRecorder;

  @override
  void initState() {
    super.initState();

    FlutterAudioRecorder.hasPermissions.then((hasPermission) {
      if (hasPermission) {
        _recordingState = RecordingState.Set;
        _recordIcon = Icons.mic;
        _recordText = 'Record';
      }
    });
  }

  @override
  void dispose() {
    _recordingState = RecordingState.UnSet;
    audioRecorder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      child: Container(
        //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
            color: Color(0xFF111328),
            // gradient: new LinearGradient(
            //   colors: [Color.deepPurple[900]],
            // ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
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
                  onPressed: () async {
                    await _onRecordButtonPressed();
                    setState(() {});
                  },
                  shape: CircleBorder(
                    //borderRadius: BorderRadius.circular(30),
                    //side: BorderSide(color: Colors.white, width: 2.0)
                  ),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Icon(
                      _recordIcon,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  child: Text(
                    _recordText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 5)
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onRecordButtonPressed() async {
    switch (_recordingState) {
      case RecordingState.Set:
        await _recordVoice();
        break;

      case RecordingState.Recording:
        await _stopRecording();
        _recordingState = RecordingState.Stopped;
        _recordIcon = Icons.mic;
        _recordText = 'Record';
        break;

      case RecordingState.Stopped:
        await _recordVoice();
        break;

      case RecordingState.UnSet:
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Please allow recording from settings.'),
        ));
        break;
    }
  }

  Future<void> _recordVoice() async {
    if (await FlutterAudioRecorder.hasPermissions) {
      await _initRecorder();

      await _startRecording();
      _recordingState = RecordingState.Recording;
      _recordIcon = Icons.stop;
      _recordText = 'Recording';
    } else {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please allow recording from settings.'),
      ));
    }
  }

  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = appDirectory.path +
        '/' +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.aac';

    audioRecorder =
        FlutterAudioRecorder(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
  }

  _startRecording() async {
    await audioRecorder.start();
    // await audioRecorder.current(channel: 0);
  }

  _stopRecording() async {
    await audioRecorder.stop();
    widget.onSaved();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RecordList()));
  }
}

