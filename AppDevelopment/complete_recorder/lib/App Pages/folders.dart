import 'package:flutter/material.dart';
import 'package:complete_recorder/homepage.dart';

class Folders extends StatefulWidget {
  @override
  _FoldersState createState() => _FoldersState();
}

class _FoldersState extends State<Folders> {
  //pulling information from the folder name class that provides folder names
  //items we want to put into the list
  //final items = List.from(FolderName.folderName);
  @override
  Widget build(BuildContext context) {
    //ROW 3; SAFE AREA, CONTAINER WITH BORDER THAT CONTAIN FILES
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text('Folders'),
        ), //Colors.white, //the background color of the scaffold is white
        body: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              padding: EdgeInsets.all(16),
              //this is a function call or a method call cause it is in a class
              //this method will be called to add or insert a new folder
              //TODO: you will have to separate this function into a dart file called "folder_creation
              //TODO: this will help will code factorization and help keep the code clean
              child: buildInsertButton(),
            ),
          ],
        ));
  }

  //i am creating the button that user will click on to add a new folder
  Widget buildInsertButton() => ElevatedButton(
        onPressed: () {},
        child: Text(
          'Add New Folder',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}

class FolderName {
  /*final String folderName;

  FolderName(this.folderName);*/

  // static final List<FolderItem> folderList = [

  // ]
}
