import 'dart:async';

import 'package:act_my_pose/screens/player_task_screen.dart';
import 'package:flutter/material.dart';

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
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    Timer(
        Duration(seconds: 2),
            () =>
                Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Player_Task_Screen())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                color: Colors.blueGrey,
              ),),
            )
          ],
        )

      ],
    );
  }
}
