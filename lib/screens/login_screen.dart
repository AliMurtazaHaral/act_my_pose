import 'package:act_my_pose/screens/result_screen.dart';
import 'package:act_my_pose/screens/signup_screen.dart';
import 'package:act_my_pose/screens/task_screen.dart';
import 'package:act_my_pose/screens/waiting_screen.dart';
import 'package:act_my_pose/screens/welcome_screen.dart';
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        fillColor: Color(0XFF201A30),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        prefix: Icon(Icons.email,color: Colors.grey,),
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Color(0XFF201A30),
        filled: true,
          prefix: const Icon(Icons.email,color: Colors.grey,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle: TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
    return Container(
        constraints: const BoxConstraints.expand(),
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: const Color(0XFF201A30),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage("assets/logo.png")),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Please Sign in to continue',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal),)),
                ),
                const SizedBox(
                  height: 20,
                ),
                emailField,
                const SizedBox(
                  height: 10,
                ),
                passwordField,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0XFF0DF5E3),
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskScreen()));
                    },
                    child: const Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      const Text("Don't have an Account?",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text('Sign up',style: TextStyle(
                          color: const Color(0XFF0DF5E3),fontWeight: FontWeight.bold,fontSize: 20
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
