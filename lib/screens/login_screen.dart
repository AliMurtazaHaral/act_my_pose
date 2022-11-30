import 'package:act_my_pose/screens/signup_screen.dart';
import 'package:act_my_pose/screens/waiting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      Column(
        children: [
          Row(
            children: [
              Text("USER NAME ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(
                width: MediaQuery.of(context).size.width*.6,
                child: emailField,
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("PASSWORD  ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(
                width: MediaQuery.of(context).size.width*.6,
                child: passwordField,
              )
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple,
            child: MaterialButton(

              padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
              minWidth: MediaQuery.of(context).size.width * 0.2,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              },
              child: Text(
                "SIGN UP",
                textAlign: TextAlign.center,
                style: const TextStyle(

                    color: Colors.white,
                    fontWeight: FontWeight.bold),

              ),),),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple,
            child: MaterialButton(

              padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
              minWidth: MediaQuery.of(context).size.width * 0.2,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WaitingScreen()));
              },
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: const TextStyle(

                    color: Colors.white,
                    fontWeight: FontWeight.bold),

              ),),)
        ],
      )
    ],
    ),
    ));
  }
}
