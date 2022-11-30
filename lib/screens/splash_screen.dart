import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    Timer(
        Duration(seconds: 2),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Image.asset("assets/logo.png"),
            ),
            Text(
              'LOADING...',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ));
  }
}
