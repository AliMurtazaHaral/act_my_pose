import 'package:act_my_pose/screens/login_selection_screen.dart';
import 'package:act_my_pose/screens/player_dashboard.dart';
import 'package:act_my_pose/screens/signup_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late VideoPlayerController videoPlayerController;
  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  bool isHidden = true;
  ChewieController? chewieController;
  // init State
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset("assets/bdvideo.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        videoPlayerController.play();
        videoPlayerController.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        userNameController.text = value!;
      },
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        fillColor: Color(0XFF201A30),
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0DF5E3)),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Email",
        prefixIcon: Icon(Icons.email,color: Colors.grey,),
        hintStyle: TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),

      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: isHidden,
      onSaved: (value) {
        passwordController.text = value!;
      },

      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0DF5E3)),
        ),
        fillColor: Color(0XFF201A30),
        filled: true,
          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Password",
        suffix: InkWell(

          onTap: togglePasswordView,
          child: Icon(
            isHidden ? Icons.visibility
                : Icons.visibility_off,color: Colors.grey,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xFf201A30),
      appBar: AppBar(
        backgroundColor: Color(0xFf201A30),
        title: Text('LOGIN HERE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
      ),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
      SizedBox.expand(
      child: FittedBox(
      // If your background video doesn't look right, try changing the BoxFit property.
      // BoxFit.fill created the look I was going for.
      fit: BoxFit.fill,
        child: SizedBox(
          width: videoPlayerController.value.size?.width ?? 0,
          height: videoPlayerController.value.size?.height ?? 0,
          child: VideoPlayer(videoPlayerController),
        ),
      ),
    ),
    SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              height: 250,
            ),
            Column(
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Login with your email',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal),)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child: emailField,),
                const SizedBox(
                  height: 10,
                ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child: passwordField,),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              color: const Color(0XFF0DF5E3),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                minWidth: MediaQuery.of(context).size.width * 0.8,
                onPressed: () {
                  signIn(userNameController.text, passwordController.text);
                },
                child: const Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 100,),
            Padding(
              padding: EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  const Text("New? ",
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPlayerScreen()));
                    },
                    child: Text('Register Here',style: TextStyle(
                        color: const Color(0XFF0DF5E3),fontWeight: FontWeight.bold,fontSize: 15
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
        ]
    ),
          );
  }
  // login function
  void signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          markStatus(),
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckScreen())),
        })
        .catchError((e) {
          Fluttertoast.showToast(msg: "Login is not successful");
        });
  }
  markStatus() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user =  FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel();
    userModel.status = 'online';
    // writing all the values
    await firebaseFirestore
        .collection("users")
        .doc('${user!.uid}')
        .update(userModel.toStatus());
  }
}
