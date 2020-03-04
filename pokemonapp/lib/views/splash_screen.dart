import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemonapp/views/components/start_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final timeout = const Duration(seconds: 3);
  final ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => StartScreen()));
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 209, 65),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: Image.asset(
                "assets/splash.png",
              ),
            ),
          ],
        ));
  }
}
