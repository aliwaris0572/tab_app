import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_app/Routes.dart';
import 'package:tab_app/model/Writeup.dart';

class ListWidget extends StatelessWidget {
  final List<Writeup> writeups;
  ListWidget({Key key, @required this.writeups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(4),
      itemCount: writeups.length,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.chat, arguments: writeups[index]);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              writeups[index].title,
                              maxLines: 2,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Text(
                                  writeups[index].meter == null ? " ": writeups[index].meter,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 14),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${writeups[index].dateTime.day} ${writeups[index].dateTime.month} ${writeups[index].dateTime.year}",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${writeups[index].dateTime.hour} : ${writeups[index].dateTime.minute}",
                              maxLines: 1,
                              style: TextStyle(fontSize: 12),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Icon(
                                  Icons.bookmark,
                                  color: _getWriteupMood(writeups[index].mood),
                                  size: 18,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  MaterialColor _getWriteupMood(Mood mood) {
    switch(mood){
      case Mood.happy:
        return Colors.green;
        break;
      case Mood.sad:
        return Colors.red;
        break;
    }
    return Colors.transparent;
  }
}
