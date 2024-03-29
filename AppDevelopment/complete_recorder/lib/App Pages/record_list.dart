import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:complete_recorder/App Pages/recorded_list_view.dart';

class RecordList extends StatefulWidget {

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  Directory appDirectory;
  Stream<FileSystemEntity> fileStream;
  List<String> records;

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
        records.sort((b, a) => a.compareTo(b));
        setState(() {});
      });
      print(appDirectory);
    });
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
      appBar: AppBar(
        title: Text("Record List"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF111328),           
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: RecordListView(
              records: records,
            )
          ),
          ],
      ),
    );
  }
}
