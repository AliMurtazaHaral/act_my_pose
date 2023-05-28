import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/storage_model.dart';
import '../model/user_model.dart';
import 'audience_vote_screen.dart';
class AudiendeViewTaskScreen extends StatefulWidget {

  final String city;

  AudiendeViewTaskScreen({ required this.city}); //key:key is used



  @override
  State<AudiendeViewTaskScreen> createState() => _AudiendeViewTaskScreenState();
}

class _AudiendeViewTaskScreenState extends State<AudiendeViewTaskScreen> {
  String url = "";
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
    final Stream<QuerySnapshot<Map<String, dynamic>>> allMechanic =
    FirebaseFirestore.instance.collection('tournament')
        .doc('pDp8z1S2hZ1BYgdKuP6C').collection(widget.city).snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> foundMechanic =
    FirebaseFirestore.instance.collection('tournament')
        .doc('pDp8z1S2hZ1BYgdKuP6C').collection(widget.city).snapshots();
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
                                            Text('  Name: ${data['userName']}',style: TextStyle(color: Colors.white),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Voteees(Player: "Task ${data['taskNumber']}"),
                                            TextButton.icon(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                                              // onPressed:
                                              // uploadImage,
                                              onPressed: () async {
                                                StorageModel storage = StorageModel();
                                                FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                                                User? user =  FirebaseAuth.instance.currentUser;
                                                UserModel userModel = UserModel();

                                                // writing all the values
                                                await firebaseFirestore
                                                    .collection("votes")
                                                    .doc('${data.id.split(' ')[0]}').collection('votes').doc(data.id)
                                                    .set(userModel.toVote());
                                                Fluttertoast.showToast(msg: "Vote submitted Successfully");
                                                },

                                              //selectedImage = null,
                                              icon: const Icon(
                                                Icons.text_rotation_none_rounded,
                                                color: Colors.white,
                                              ),
                                              label: const Text(
                                                "Submit Votes",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        )
                                            : const SizedBox();
                                      })
                              ]),
                            )
                                : SizedBox(height: 10,);
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
