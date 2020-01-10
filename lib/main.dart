import 'package:flutter/material.dart';
import 'package:tab_app/Routes.dart';
import 'package:tab_app/screens/AddNoteScreen.dart';
import 'package:tab_app/screens/HomeScreen.dart';

void main() => runApp(MaterialApp(
      title: 'TabApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.chat: (context) => AddNoteScreen(),
      },
    ));
