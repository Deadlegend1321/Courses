import 'package:courses/src/pages/homes.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 6,
        navigateAfterSeconds: Homespage(),
        image: new Image.asset('gif/bp.gif'),
        backgroundColor: Colors.black,
        photoSize: 150.0,
    );
  }
}
