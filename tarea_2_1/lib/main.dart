import 'package:flutter/material.dart';
import 'package:tarea_2_1/src/views/homepage.dart';
import 'package:tarea_2_1/src/views/loginpage.dart';
import 'package:tarea_2_1/src/views/recordpage.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    routes: {
      '/record': (context) => RecordPage(),
      '/home': (context) => Homepage(),
    },
  ));
}
