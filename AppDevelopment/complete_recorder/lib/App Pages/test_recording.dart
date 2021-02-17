import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:complete_recorder/App Pages/recorded_list_view.dart';
import 'package:complete_recorder/App Pages/recording_button.dart';

class TestRecording extends StatefulWidget {
  @override
  _TestRecordingState createState() => _TestRecordingState();
}

class _TestRecordingState extends State<TestRecording> {
  //object declaration
  Directory
      appDirectory; //we may need this to store the recordings in a directory
  Stream<FileSystemEntity> fileStream; //we may this to play back recordings
  List<String>
      records; //this looks like an array that we may use to give recording names

  //not too sure what they do yet
  @override
  void initState() {
    super.initState();
    records = [];
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  //not too sure what they do yet
  @override
  void dispose() {
    fileStream = null;
    appDirectory = null;
    records = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Voice Recorder"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: RecordListView(
              records: records,
            ),
          ),
          Expanded(
            flex: 1,
            child: RecordButton(
              onSaved: _onRecordComplete,
            ),
          )
        ],
      ),
    );
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }
}
