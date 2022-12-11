import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        Duration(seconds: 6),
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
                image: AssetImage("assets/waiting_screen_bg.jpeg"), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/logo.png",
                    ),

                    width: MediaQuery.of(context).size.width * .8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  SpinKitCircle(
                      duration: const Duration(seconds: 2),
                      size: 140,
                      itemBuilder: (context, index) {
                        final colors = [
                          Color(0XFF0DF5E3),
                          Color(0XFF0DF5E3),
                          Color(0XFF0DF5E3)
                        ];
                        final color = colors[index % colors.length];

                        return DecoratedBox(
                            decoration: BoxDecoration(
                                color: color, shape: BoxShape.circle));
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
