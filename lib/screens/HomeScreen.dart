import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tab_app/Routes.dart';
import 'package:tab_app/model/Writeup.dart';
import 'package:tab_app/widgets/GridWidget.dart';
import 'package:tab_app/widgets/ListWidget.dart';

enum ViewType { list, grid }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController _animationController;
  Animation<double> _fabAnimation;
  ViewType _viewType;
  bool _showFab = true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _viewType = ViewType.list;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _fabAnimation =
        Tween<double>(begin: 0, end: pi / 4).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0)
          _showFab = true;
        else
          _showFab = false;
      });
    });
  }

  Icon _getViewTypeIcon(ViewType viewType) {
    switch (viewType) {
      case ViewType.list:
        return Icon(Icons.grid_on);
        break;
      case ViewType.grid:
        return Icon(Icons.format_align_justify);
        break;
    }
    return null;
  }

  Widget _getWidgetByViewType(ViewType viewType) {
    switch (viewType) {
      case ViewType.list:
        return ListWidget(
          writeups: _getWriteups(),
        );
        break;
      case ViewType.grid:
        return GridWidget(
          number: 50,
        );
        break;
    }
    return Container();
  }

  List<Writeup> _getWriteups() {
    int i = 50;
    List<Writeup> writeups = List();
    while (i > 0) {
      if (i % 3 == 0)
        writeups.add(Writeup(
            title: "This is a sample title number $i.",
            content: "This is sample content which is taken from somewhere.",
            status: WriteupStatus.ongoing,
            mood: Mood.happy,
            dateTime: DateTime.now()));
      else
        writeups.add(Writeup(
            title: "This is a sample title number $i.",
            content: "This is sample content which is taken from somewhere.",
            status: WriteupStatus.completed,
            mood: Mood.sad,
            dateTime: DateTime.now()));
      i--;
    }
    return writeups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
          builder: (context) => Visibility(
              visible: _showFab,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Transform.scale(
                          alignment: Alignment.center,
                          scale: _fabAnimation.value,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: FloatingActionButton(
                                heroTag: "Red",
                                backgroundColor: Colors.white,
                                splashColor: Colors.red,
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.chat,
                                      arguments: Writeup(
                                          title: "",
                                          content: "",
                                          status: WriteupStatus.ongoing,
                                          mood: Mood.sad,
                                          dateTime: DateTime.now()));
                                  _animationController.reverse();
                                },
                                child: Icon(
                                  Icons.message,
                                  color: Colors.red,
                                ),
                              ))),
                      Transform.scale(
                          alignment: Alignment.center,
                          scale: _fabAnimation.value,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: FloatingActionButton(
                                heroTag: "Green",
                                backgroundColor: Colors.white,
                                splashColor: Colors.green,
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.chat,
                                      arguments: Writeup(
                                          title: "",
                                          content: "",
                                          status: WriteupStatus.ongoing,
                                          mood: Mood.happy,
                                          dateTime: DateTime.now()));
                                  _animationController.reverse();
                                },
                                child: Icon(
                                  Icons.message,
                                  color: Colors.green,
                                ),
                              ))),
                    ],
                  ),
                  Container(
                      width: 55,
                      height: 55,
                      child: Transform.rotate(
                          angle: _fabAnimation.value,
                          child: FloatingActionButton(
                            heroTag: "Main",
                            onPressed: () {
                              setState(() {
                                if (_animationController.isDismissed)
                                  _animationController.forward();
                                else if (_animationController.isCompleted)
                                  _animationController.reverse();
                              });
                            },
                            child: Icon(Icons.add),
                          )))
                ],
              ))),
      appBar: AppBar(
        title: Text("TabApp"),
        actions: <Widget>[
          IconButton(
              icon: _getViewTypeIcon(_viewType),
              onPressed: () {
                setState(() {
                  if (_viewType == ViewType.list)
                    _viewType = ViewType.grid;
                  else if (_viewType == ViewType.grid)
                    _viewType = ViewType.list;
                });
              })
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "Ongoing",
//              icon: Icon(Icons.message),
            ),
            Tab(
              text: "Completed",
//              icon: Icon(Icons.local_florist),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          _getWidgetByViewType(_viewType),
          _getWidgetByViewType(_viewType),
        ],
        controller: _tabController,
      ),
    );
  }
}
