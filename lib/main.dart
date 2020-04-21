import 'package:courses/src/login.dart';
import 'package:courses/src/pages/home.dart';
import 'package:flutter/material.dart';

import 'src/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
