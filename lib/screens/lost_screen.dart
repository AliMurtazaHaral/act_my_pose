import 'dart:async';
import 'package:act_my_pose/screens/player_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:act_my_pose/screens/player_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class LostScreen extends StatefulWidget {
  LostScreen({Key? key}) : super(key: key);

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    //getfirebasedata();
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid).get()
        .then((value) {
      loggedInUser = UserModel.fromMapPlayerRegistration(value.data());
      setState(() {});
    });
  }
  String? uid;
  int counter = 0;
  getfirebasedata() async{

    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      String city = '';
      querySnapshot.docs.forEach((doc) {
        if(doc['status']=='online'){
          setState(() {
            if(counter==0){
              city = doc['city'];
              counter++;
            }
          });
        }
        if(counter>=1 && doc.id != user!.uid && doc['status']=='online'){
          if(doc['city']==city){
            setState(() {
              uid = doc.id;
              counter++;
            });
          }
        }
      });
    });
  }
  User? user =  FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("UNFORTUNATELY YOU LOST THIS GAME" , style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
                color: const Color(0XFF0DF5E3),
              ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              color: const Color(0XFF0DF5E3),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                minWidth: MediaQuery.of(context).size.width * 0.8,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Dashboard_Screen()));
                  // signIn(userNameController.text, passwordController.text);
                },
                child: const Text(
                  "FINISH",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )

      ],
    );
  }
}
