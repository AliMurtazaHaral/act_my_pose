import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import 'audience_vote_screen.dart';
class AudiendeViewTaskScreen extends StatefulWidget {
  const AudiendeViewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AudiendeViewTaskScreen> createState() => _AudiendeViewTaskScreenState();
}

class _AudiendeViewTaskScreenState extends State<AudiendeViewTaskScreen> {
  String url = "";
  final Stream<QuerySnapshot<Map<String, dynamic>>> allMechanic =
  FirebaseFirestore.instance.collection('tournament').snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> foundMechanic =
  FirebaseFirestore.instance.collection('tournament').snapshots();



  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getImg("shop.jpg");
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMapRegsitration(value.data());
      setState(() {});
    });
  }
  int a = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf201A30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('View Task',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                height: MediaQuery.of(context).size.height*.1,
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color(0xFf201A30),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: MediaQuery.of(context).size.height * 1,
                        child: StreamBuilder(
                          stream: foundMechanic,
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            List<Widget> Data = [];
                            var image_2;
                            final product = streamSnapshot.data?.docs;
                            return product?.length != 0
                                ? SingleChildScrollView(
                              child: Column(children: [
                                for (var data in product!)

                                  FutureBuilder<String>(
                                      future: getImg(data["pose"]),
                                      builder: (_, imageSnapshot) {
                                        final imageUrl = imageSnapshot.data;
                                        return imageUrl != null
                                            ? Column(
                                          children: [
                                            Align(
                                              alignment:Alignment.center,
                                              child: Image(image: NetworkImage(imageUrl),
                                                height: MediaQuery.of(context).size.height*.25,
                                                width: MediaQuery.of(context).size.width*.5,),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Voteees(Player: "Task ${a++}"),
                                          ],
                                        )
                                            : const SizedBox();
                                      })
                              ]),
                            )
                                : SizedBox(height: 1000,);
                          },
                        ),
                      ),

                    ],
                  )),
            ],
          )
      ),
    );
  }

  Future<String> getImg(String s) async {
    final ref = firebase_storage.FirebaseStorage.instance
        .ref('poseImages/')
        .child(s);
    url = await ref.getDownloadURL();
    return await ref.getDownloadURL();
  }
}
class Voteees extends StatefulWidget {
  String Player;
  Voteees({Key? key, required this.Player}) : super(key: key);

  @override
  State<Voteees> createState() => _VoteeesState();
}

class _VoteeesState extends State<Voteees> {
  bool isChecked0 = false;
  double width = 10.0;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      return const Color(0XFF0DF5E3);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.Player,
          style: TextStyle(color: const Color(0XFF0DF5E3)),
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked0,
          onChanged: (bool? value) {
            setState(() {
              isChecked0 = value!;

            });
          },
        ),
        SizedBox(
          width: width,
        ),

      ],
    );
  }
}
