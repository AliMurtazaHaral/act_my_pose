import 'package:act_my_pose/screens/payer_edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PlayerProfileScreen extends StatefulWidget {
  const PlayerProfileScreen({Key? key}) : super(key: key);

  @override
  State<PlayerProfileScreen> createState() => _PlayerProfileScreenState();
}


class _PlayerProfileScreenState extends State<PlayerProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid).get()
        .then((value) {
      loggedInUser = UserModel.fromMapPlayerRegistration(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFf201A30),
      appBar: AppBar(
        backgroundColor: Color(0xFf201A30),
        title: Text(loggedInUser.userName.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFF0DF5E3)),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),

      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width*1,
            child: Image(
              image: AssetImage(
                "assets/logo.png",
              ),
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)),
              elevation: 5,
              color: const Color(0XFF0DF5E3),
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20 ,15 ,20 ,15),
                  minWidth: MediaQuery.of(context).size.width * 0.3,
                  onPressed: () async {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PlayerEditProfileScreen()));
                  },
                  child: Text(
                    "Edit",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SizedBox(height: 35,),
          Align(
            alignment: Alignment.center,
            child: Text("Game Played   0",style: TextStyle(
              color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 35,),
          Align(
            alignment: Alignment.center,
            child: Text("Game Won   0",style: TextStyle(
                color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 35,),
          Align(
            alignment: Alignment.center,
            child: Text("Win Rate   0.0%",style: TextStyle(
                color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
    );
  }

}
