import 'package:flutter/material.dart';
import 'package:complete_recorder/App Pages/recorded_list_view.dart';

class RecordName extends StatefulWidget {
  @override
  _RecordName createState() => _RecordName();
}

class _RecordName extends State<RecordName> {
  final TextEditingController titleController = new TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // titleController.text = 'Hello';
  // }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.drive_file_rename_outline),
      onSelected: (result) {
        if (result == 0) {
          showTitleDialog();
        }
      },
      itemBuilder: (BuildContext bc) => [
        PopupMenuItem(
          child: Text("Rename  "),
            value: 0,
          ),
      ]);

    // return Scaffold(
    //     resizeToAvoidBottomInset: false,
    //     body: Center(
    //       child: Column(
    //         children: <Widget>[
    //           Text(titleController.text),
    //           SizedBox(
    //             height: 50,
    //           ),
    //           FlatButton(
    //               color: Colors.redAccent,
    //               onPressed: () {
    //                 showTitleDialog();
    //               },
    //               child: Text(
    //                 'Show Dialog',
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                 ),
    //               ))
    //         ],
    //       ),
    //     ));
  }

  Future showTitleDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Form(
              key: _keyDialogForm,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.ac_unit),
                    ),
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    onSaved: (val) {
                      titleController.text = val;
                      setState(() {});
                    },
                    autovalidate: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Title Name';
                      }

                      return null;
                    },
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  if (_keyDialogForm.currentState.validate()) {
                    _keyDialogForm.currentState.save();

                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
                color: Colors.blue,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }
}