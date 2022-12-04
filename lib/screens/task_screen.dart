import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
            children: [
              Image(
                image: AssetImage("assets/logo.png",),height: 200,width: MediaQuery.of(context).size.width*.8,
              ),
              Text("Task 1",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:30
                ),),
              Image(
                image: AssetImage("assets/pose.PNG",),height: 200,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,
                child: MaterialButton(

                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                  minWidth: MediaQuery.of(context).size.width * 0.2,
                  onPressed: () {

                  },
                  child: Text(
                    "SUBMIT",
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                        color: Color(0xFf201A30),
                        fontWeight: FontWeight.bold),

                  ),),)
            ],
          ),
        ));
  }
}
