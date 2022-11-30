import 'package:act_my_pose/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "",
        hintStyle: const TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "",
        hintStyle: const TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage("assets/logo.png")),
              Text('WAITING FOR OTHER\NPARTICIPANTS...',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(
                height: 20,
              ),
              Text('THE GAME WILL START SHORTLY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
        ));
  }
}
