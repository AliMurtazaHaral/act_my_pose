import 'package:act_my_pose/screens/audience_dashboard.dart';
import 'package:act_my_pose/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../model/user_model.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0DF5E3)),
        ),
        prefixIcon: Icon(Icons.email,color: Colors.grey,),
        fillColor: Color(0XFF201A30),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Email",
        hintStyle: TextStyle(
          color: Colors.grey, // <-- Change this
          fontSize: null,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        userNameController.text = value!;
      },
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF0DF5E3)),
        ),
        fillColor: Color(0XFF201A30),
        filled: true,
        prefixIcon: Icon(Icons.person_add_alt_1_sharp,color: Colors.grey,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " User name",
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
        suffix: InkWell(

          onTap: togglePasswordView,
          child: Icon(
            isHidden ? Icons.visibility
                : Icons.visibility_off,color: Colors.grey,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Password",
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('SIGN UP HERE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Login',style: TextStyle(
                  color: Color(0XFF0DF5E3),fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFF0DF5E3)),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
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
                            child: Text('Sign up',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.normal),)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: userNameField,),
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
                        signUp(emailController.text, passwordController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        const Text("Already have an Account? ",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text('Login',style: TextStyle(
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
  final _auth = FirebaseAuth.instance;
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    // writing all the values

    userModel.email = emailController.text;
    userModel.password = passwordController.text;
    userModel.userName = userNameController.text;
    await firebaseFirestore
        .collection("users")
        .doc(user?.uid)
        .set(userModel.toBecomeRegistration());
    Fluttertoast.showToast(msg: "Your account has been created successfully");
  }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
