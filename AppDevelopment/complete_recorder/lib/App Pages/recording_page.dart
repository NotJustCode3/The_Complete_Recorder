// TODO Implement this library.
import 'dart:io';
import 'package:audio_wave/audio_wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart'; //for datetime formatting
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
  int _waveDuration = 170;
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

  bool _hasBeenPressed = false;
  double _soundOpacity = 1.0;
  int _soundDuration = 0;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Stack(
                  children: [                    
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child:
                      AudioWave(
                        height: 80,
                        width: 350,
                        alignment: 'bottom',
                        spacing: 5,
                        beatRate: Duration(milliseconds: _waveDuration),
                        bars: [
                          AudioWaveBar(height: 10, color: Colors.grey[300]),
                          AudioWaveBar(height: 20, color: Colors.grey[300]),
                          AudioWaveBar(height: 45, color: Colors.grey[300]),
                          AudioWaveBar(height: 30, color: Colors.grey[400]),
                          AudioWaveBar(height: 40, color: Colors.grey[400]),
                          AudioWaveBar(height: 50, color: Colors.grey[400]),
                          AudioWaveBar(height: 75, color: Colors.grey[400]),
                          AudioWaveBar(height: 60, color: Colors.grey[600]),
                          AudioWaveBar(height: 40, color: Colors.grey[600]),
                          AudioWaveBar(height: 90, color: Colors.grey[700]),
                          AudioWaveBar(height: 100, color: Colors.grey[700]),
                          AudioWaveBar(height: 120, color: Colors.grey[700]),
                          AudioWaveBar(height: 100, color: Colors.grey[600]),
                          AudioWaveBar(height: 110, color: Colors.grey[500]),
                          AudioWaveBar(height: 120, color: Colors.grey[500]),
                          AudioWaveBar(height: 100, color: Colors.grey[500]),
                          AudioWaveBar(height: 90, color: Colors.grey[500]),
                          AudioWaveBar(height: 80, color: Colors.grey[400]),
                          AudioWaveBar(height: 75, color: Colors.grey[400]),
                          AudioWaveBar(height: 60, color: Colors.grey[400]),
                          AudioWaveBar(height: 65, color: Colors.grey[300]),
                          AudioWaveBar(height: 50, color: Colors.grey[300]),
                          AudioWaveBar(height: 40, color: Colors.grey[300]),
                          AudioWaveBar(height: 30, color: Colors.grey[200]),
                          AudioWaveBar(height: 20, color: Colors.grey[200]),
                          AudioWaveBar(height: 10, color: Colors.grey[200]),
                          AudioWaveBar(height: 7, color: Colors.grey[200]),
                          AudioWaveBar(height: 5, color: Colors.grey[200]),
                          AudioWaveBar(height: 2, color: Colors.grey[200]),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        height: 220,
                        width: 350,
                        child: AnimatedOpacity(
                          opacity: _soundOpacity,
                          duration: Duration(milliseconds: 0),
                          child: Image(image: AssetImage('res/wave.png')),
                        ),
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: _hasBeenPressed ? Colors.transparent : Color(0xFF0A0E21),
                        )
                    ),
                  ],
                ),
                Expanded(
                  child: Container(                    
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      color: Color(0xFF111328),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7.0,
                          spreadRadius: 2.0,
                        ),
                      ],                     
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
                                setState(() {
                                  _hasBeenPressed = !_hasBeenPressed;
                                  if(_hasBeenPressed == true){
                                    return _soundOpacity = 0.0;
                                  }
                                  else if(_hasBeenPressed == false){
                                    return _soundOpacity = 1.0;
                                  }
                                });
                              },
                              shape: CircleBorder(                                
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
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
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
    final currentDateTime = DateTime.now().millisecondsSinceEpoch.toString();
    DateTime recordedDate =
    DateTime.fromMillisecondsSinceEpoch(int.parse(currentDateTime));
    final DateFormat formatter = DateFormat('yyyy-MMM-dd-hh:mm:ss');
    final String formatted = formatter.format(recordedDate);
    String filePath = appDirectory.path + '/' + currentDateTime + '-' + currentDateTime + '.aac';

    audioRecorder =
        FlutterAudioRecorder(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
  }

  _startRecording() async {
    await audioRecorder.start();    
  }

  _stopRecording() async {
    await audioRecorder.stop();
    widget.onSaved();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecordList()));
  }
}
