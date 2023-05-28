//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:act_my_pose/screens/player_dashboard.dart';
import 'package:act_my_pose/screens/player_prize_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(Player_Prize_List_Screen());

class Player_Prize_List_Screen extends StatelessWidget {
  Player_Prize_List_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf201A30),
      appBar: AppBar(
        title: Text("Pick a Reward"),
        backgroundColor: const Color(0XFF0DF5E3),
      ),
      body: Stack(
        children: [
          Container(
            child: const Image(image: AssetImage(
                "assets/waiting_screen_bg.jpeg"
            ),
              fit: BoxFit.fill,),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Center(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/logo.png")),
                    Text(
                      "Prize List",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: const Color(0XFF0DF5E3),
                      ),
                    ),
                    Prize(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                    // Prize(Player: "Phone      "),
                    // Prize(Player: "Bike          "),
                    // Prize(Player: "Laptop     "),
                    // Prize(Player: "Money     "),
                    TextButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                      // onPressed:
                      // uploadImage,
                      onPressed: () async {
                        Fluttertoast.showToast(msg:'Selected prize will reached you soon');
                        Navigator.of(context)
                            .pushAndRemoveUntil(
                          MaterialPageRoute(builder: (builder) => Player_Dashboard_Screen()),
                              (route) => false,
                        );
                      },

                      //selectedImage = null,
                      icon: Icon(
                        Icons.subdirectory_arrow_left,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                  ],
                )),
          ),
        ],
      )
    );
  }
}

class Prize extends StatefulWidget {
  Prize({Key? key}) : super(key: key);

  @override
  State<Prize> createState() => _PrizeState();
}

class _PrizeState extends State<Prize> {
  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      return const Color(0XFF0DF5E3);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Wallet     ",
                style: TextStyle(color: const Color(0XFF0DF5E3)),
              ),
              Icon(
                Icons.wallet,
                color: const Color(0XFF0DF5E3),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked0,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked0 = value!;
                    if(isChecked0 == true){
                      isChecked4 = false;
                      isChecked1 = false;
                      isChecked2 = false;
                      isChecked3 = false;
                    }
                    postToFirebaseStore('Wallet');
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Bracelet  ",
                style: TextStyle(color: const Color(0XFF0DF5E3)),
              ),
              ImageIcon(
                AssetImage(
                  "assets/bracelet.png"
                ),
                color: const Color(0XFF0DF5E3),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked1 = value!;
                    if(isChecked1 == true){
                      isChecked0 = false;
                      isChecked4 = false;
                      isChecked2 = false;
                      isChecked3 = false;
                    }
                    postToFirebaseStore('Bracelet');
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Locket     ",
                style: TextStyle(color: const Color(0XFF0DF5E3)),
              ),
              ImageIcon(
                  AssetImage(
                      "assets/locket.png"
                  ),
                color: const Color(0XFF0DF5E3),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked2,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked2 = value!;
                    if(isChecked2 == true){
                      isChecked0 = false;
                      isChecked1 = false;
                      isChecked4 = false;
                      isChecked3 = false;
                    }
                    postToFirebaseStore('Locket');
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Ring         ",
                style: TextStyle(color: const Color(0XFF0DF5E3)),
              ),
              ImageIcon(
                  AssetImage(
                      "assets/ring.png"
                  ),
                color: const Color(0XFF0DF5E3),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked3,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked3 = value!;
                    if(isChecked3 == true){
                      isChecked0 = false;
                      isChecked1 = false;
                      isChecked2 = false;
                      isChecked4 = false;
                    }
                    postToFirebaseStore('Ring');
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Diary        ",
                style: TextStyle(color: Color(0XFF0DF5E3)),
              ),
              const ImageIcon(
                  AssetImage(
                      "assets/diary.png"
                  ),
                color: Color(0XFF0DF5E3),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked4,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked4 = value!;
                    if(isChecked4 == true){
                      isChecked0 = false;
                      isChecked1 = false;
                      isChecked2 = false;
                      isChecked3 = false;
                    }
                    postToFirebaseStore('Dairy');
                  });
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
  postToFirebaseStore(String prize) async {
    User? user =  FirebaseAuth.instance.currentUser;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    // writing all the values
    await firebaseFirestore
        .collection("winnerList")
        .doc('${user!.uid}')
        .set({'name':loggedInUser.userName,'prize':prize});
  }
}
