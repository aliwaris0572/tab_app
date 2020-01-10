import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_app/model/Writeup.dart';

class AddNoteScreen extends StatelessWidget {


//  AddNoteScreen({Key key, this.writeup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Writeup writeup = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: _getMoodColor(writeup.mood),
      appBar: AppBar(
        title: Text("Add"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.assignment_turned_in),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: writeup.title),
              decoration: InputDecoration(
                  labelText: "Title", hintText: "Please enter title"),
              maxLines: 1,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Meter", hintText: "Please enter meter"),
              maxLines: 1,
            ),
            Expanded(
              flex: 1,
              child: TextField(
                controller: TextEditingController(text: writeup.content),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: "Content",
                    hintText: "Please enter content",
                    border: InputBorder.none),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getMoodColor(Mood mood) {
   switch(mood){
     case Mood.happy:
       return Color(0xffefffed);
       break;
     case Mood.sad:
       return Color(0xffffeded);
       break;
   }
   return Colors.transparent;
  }
}
