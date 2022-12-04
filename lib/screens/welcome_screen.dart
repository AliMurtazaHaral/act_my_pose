import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Image(
                image: AssetImage(
                  "assets/logo.png",
                ),
              ),
              Text(
                "WELCOME",
                style: TextStyle(
                    color: const Color(0XFF0DF5E3),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Image(
                image: AssetImage(
                  "assets/battle.PNG",
                ),
                height: 200,
              ),
            ],
          ),
        ));
  }
}

//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
