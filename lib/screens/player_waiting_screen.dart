import 'dart:async';

import 'package:act_my_pose/screens/player_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Player_Waiting_Screen extends StatefulWidget {
  Player_Waiting_Screen({Key? key}) : super(key: key);

  @override
  State<Player_Waiting_Screen> createState() => _Player_Waiting_ScreenState();
}

class _Player_Waiting_ScreenState extends State<Player_Waiting_Screen> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    getfirebasedata();
    super.initState();

  }
  int counter = 0;
  getfirebasedata() async{

    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc['status']=='online'){
          setState(() {
            counter++;
          });
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return counter>=1?const Player_Task_Screen(): Stack(
      children: [
        Container(
          child: const Image(image: AssetImage(
            "assets/waiting_screen_bg.jpeg"
          ),
          fit: BoxFit.fill,),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          children: [
            const Image(image: AssetImage(
              "assets/logo.png"
            ),
            fit: BoxFit.cover,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("WAITING FOR OTHER \n    PLAYERS...." , style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
                color: const Color(0XFF0DF5E3),
              ),),
            )
          ],
        )

      ],
    );
  }
}
