//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'dart:io';
import 'package:act_my_pose/screens/result_screen.dart';
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
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
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
                    height: 200,
                    width: MediaQuery.of(context).size.width * .8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Task 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Submit a photo in the following format:",
                    style: TextStyle(
                        color: Color(0XFF0DF5E3), fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage(
                      "assets/pose.PNG",
                    ),
                    height: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                    onPressed: () async {},

                    //selectedImage = null,
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                    // onPressed:
                    // uploadImage,
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen()));
                    },

                    //selectedImage = null,
                    icon: Icon(
                      Icons.upload_file,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Submit Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
