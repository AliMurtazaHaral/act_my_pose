import 'package:act_my_pose/screens/audience_edit_profile_screen.dart';
import 'package:act_my_pose/screens/payer_edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AudienceProfileScreen extends StatefulWidget {
  const AudienceProfileScreen({Key? key}) : super(key: key);

  @override
  State<AudienceProfileScreen> createState() => _AudienceProfileScreenState();
}


class _AudienceProfileScreenState extends State<AudienceProfileScreen> {
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
                        context, MaterialPageRoute(builder: (context) => AudienceEditProfileScreen()));
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
        ],
      ),
    );
  }

}
