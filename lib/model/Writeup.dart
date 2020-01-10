import 'package:flutter/cupertino.dart';

enum WriteupStatus { ongoing, completed }
enum Mood {happy, sad}

class Writeup {
  int id;
  String title, content, meter;
  WriteupStatus status;
  Mood mood;
  DateTime dateTime;

  Writeup(
      {this.id = -1,
      @required this.title,
      @required this.content,
      this.meter,
      @required this.status,
      @required this.mood,
      @required this.dateTime});
}

//id
//title
//content
//status (ongoing, completed)
//meter
//timestamp
