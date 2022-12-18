import 'package:act_my_pose/screens/player_profile_screen.dart';
import 'package:act_my_pose/screens/player_task_screen.dart';
import 'package:act_my_pose/screens/player_waiting_screen.dart';
import 'package:act_my_pose/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Player_Dashboard_Screen extends StatefulWidget {
  const Player_Dashboard_Screen({Key? key}) : super(key: key);

  @override
  State<Player_Dashboard_Screen> createState() =>
      _Player_Dashboard_ScreenState();
}

class _Player_Dashboard_ScreenState extends State<Player_Dashboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf201A30),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: Color(0XFF0DF5E3),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerProfileScreen()));
                    },
                    icon: const Image(
                      image: AssetImage(
                        "assets/icon_profile.png",
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundColor: Color(0XFF0DF5E3),
                  child: IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: List.generate(
                150 ~/ 10,
                (index) => Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 2,
                      ),
                    )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            child: Image(
              image: AssetImage(
                "assets/logo.png",
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white)),
            elevation: 5,
            color: const Color(0XFF0DF5E3),
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Player_Waiting_Screen()));
                },
                child: Text(
                  "Start Game",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white)),
            elevation: 5,
            color: const Color(0XFF0DF5E3),
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {},
                child: Text(
                  "Quit Game",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
