import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:complete_recorder/App Pages/search_button.dart';
import 'package:complete_recorder/App Pages/feature_button.dart';
import 'package:complete_recorder/App Pages/recording_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        records = records.toList();
        setState(() {});
      });
    });
    print(appDirectory);
  }

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
      backgroundColor: Color(
          0xFF0A0E21), //Colors.white, //the background color of the scaffold is white
      body: SafeArea(
        //creating a sfe area to start drawing elements on to the scaffold widget
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: SearchButton(),
            ),
            Expanded(
              flex: 0,
              child: FeatureButton(),
            ),

            // LINE DIVIDER
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: const Divider(
                color: Colors.grey,
              ),
            ),

            Expanded(
              flex: 2,
              child: RecordPage(
                onSaved: _onRecordComplete,
              ),
            ),
          ],
        ),
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
