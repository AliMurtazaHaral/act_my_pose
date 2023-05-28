import 'dart:async';

import 'package:act_my_pose/screens/lost_screen.dart';
import 'package:act_my_pose/screens/player_result_screen.dart';
import 'package:act_my_pose/screens/player_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';
class PlayerWaitResultScreen extends StatefulWidget {
  PlayerWaitResultScreen({Key? key}) : super(key: key);

  @override
  State<PlayerWaitResultScreen> createState() => _PlayerWaitResultScreenState();
}

class _PlayerWaitResultScreenState extends State<PlayerWaitResultScreen> with TickerProviderStateMixin{
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
  int counter = 0;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Image(image: AssetImage(
              "assets/waiting_screen_bg.jpeg"
          ),
            fit: BoxFit.fill,),
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
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              color: const Color(0XFF0DF5E3),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                minWidth: MediaQuery.of(context).size.width * 0.8,
                onPressed: () {
                  Result();
                 // signIn(userNameController.text, passwordController.text);
                },
                child: const Text(
                  "REFRESH FOR RESULT",
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
  User? user = FirebaseAuth.instance.currentUser;
  void Result() async{
    String id = user!.uid;
    String id2 = '';
    await FirebaseFirestore.instance
        .collection('startedGame')
        .get()
        .then((QuerySnapshot querySnapshot) {
      String city = '';
      querySnapshot.docs.forEach((doc) {
        if(doc['secondPLayer'] != user!.uid && user!.uid == doc.id){
          setState(() {
            id2 = doc['secondPLayer'];
          });
        }
      });
    });//Records are 3
    var query = FirebaseFirestore.instance.collection("users").doc(id).collection('votes');
    var snapshot = await query.get();
    var count = snapshot.size;
    var query1 = FirebaseFirestore.instance.collection("users").doc(id2).collection('votes');
    var snapshot1 = await query1.get();
    var count1 = snapshot1.size;
    if(count>count1){
      postToFirebase();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen(firstP:count,secondP:count1)));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LostScreen()));
    }
  }
  Future<void> postToFirebase()async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // writing all the values
    await firebaseFirestore
        .collection("users")
        .doc('${user!.uid}')
        .update({'gameWon':loggedInUser.gameWon!+1});
  }
}
