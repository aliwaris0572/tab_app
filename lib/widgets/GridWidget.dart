import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final int number;

  GridWidget({this.number});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(4),
      crossAxisCount: 3,
      childAspectRatio: 0.9,
      children: [
        for (int i = 0; i < number; i++)
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          flex: 0,
                          child: Text(
                            "Some title for some content shown here with some textaaaaaaaaaaaaaaa aaaaaaaaaa aaaaaaaaaaaaaaaa",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Text(
                                "Some aaaaaaasfsdfassssssssssss  sdf sdf s df s df sdf s df sd f sdf s dfssssssssssssssssssssssssssssssssssssssssss",
                                maxLines: 4,
                                softWrap: true,
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ))),
                      Expanded(
                          flex: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "20 Jan 2019",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "12:00 PM",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 12),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                                  child: Icon(
                                    Icons.bookmark,
                                    size: 18,
                                    color: Colors.green,
                                  ))
                            ],
                          ))
                    ],
                  )),
            ),
          ),
      ],
    );
  }
}
