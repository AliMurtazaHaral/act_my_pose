import 'package:act_my_pose/screens/audience_dashboard.dart';
import 'package:act_my_pose/screens/player_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid).get()
        .then((value) {
      loggedInUser = UserModel.fromMapRegsitration(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return loggedInUser.profession=='Player'? Player_Dashboard_Screen():Audience_Dashboard_Screen();
  }
}
