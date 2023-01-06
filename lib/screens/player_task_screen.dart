//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:act_my_pose/model/storage_model.dart';
import 'package:act_my_pose/screens/audience_result_screen.dart';
import 'package:act_my_pose/screens/player_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Player_Task_Screen extends StatefulWidget {
  const Player_Task_Screen({Key? key}) : super(key: key);

  @override
  State<Player_Task_Screen> createState() => _Player_Task_ScreenState();
}

class _Player_Task_ScreenState extends State<Player_Task_Screen> {
  Reference? getUrl;
  Random random = new Random();
   // from 0 upto 99 included
  int timer =300;
  bool canceltimer = false;
  String showtimer = "300";
  int task = 1;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    starttimer();
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid).get()
        .then((value) {
      loggedInUser = UserModel.fromMapPlayerRegistration(value.data());
      setState(() {});
    });
  }
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      if(mounted) {
        setState(() {
          if (timer < 1) {
            if(task==5) {
              t.cancel();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
            }
            selectedImage = null;
            task = task+1;
            timer =300;

          } else if (canceltimer == true) {
            t.cancel();
          } else {
            timer = timer - 1;
          }
          showtimer = timer.toString();
        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    final randomNumber = random.nextInt(5)+1;
    return Stack(
      children: [
        Container(
          child: const Image(image: AssetImage(
              "assets/waiting_screen_bg.jpeg"
          ),
          fit: BoxFit.fill,),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
            constraints: const BoxConstraints.expand(),
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/bgImage.jpeg"), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/logo.png",
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width * .8,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "Task $task",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Submit a photo in the following format:",
                        style: TextStyle(
                            color: Color(0XFF0DF5E3), fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      selectedImage==null?Image(
                        image: AssetImage(
                          "assets/pose$task.jpeg",
                        ),
                        height: 200,
                      ): Image.file(
                        selectedImage!,
                        width: MediaQuery.of(context).size.width * .5,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                        onPressed: () async {

                          pickImage(ImageSource.gallery);

                        },

                        //selectedImage = null,
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF0DF5E3))),
                        // onPressed:
                        // uploadImage,
                        onPressed: () async {
                          await uploadImage();
                          if(selectedImage!=null){
                            if(message=='Tree pose' && task==1){
                              StorageModel storage = StorageModel();
                              storage.uploadFileImage(selectedImage!.path,selectedImage!.path.split('/').last);
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              User? user =  FirebaseAuth.instance.currentUser;
                              UserModel userModel = UserModel();

                              // writing all the values

                              userModel.pose =selectedImage!.path.split('/').last;
                              userModel.userName = loggedInUser.userName;
                              userModel.taskNumber = task.toString();
                              await firebaseFirestore
                                  .collection("tournament")
                                  .doc('${user?.uid} pose$task')
                                  .set(userModel.toTask()).then((value) =>
                              selectedImage=null,);

                              task= task+1;
                              timer = 300;
                              if(task==6){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
                              }
                            }
                            else if (message=='warrior2 pose' && task==2){
                              StorageModel storage = StorageModel();
                              storage.uploadFileImage(selectedImage!.path,selectedImage!.path.split('/').last);
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              User? user =  FirebaseAuth.instance.currentUser;
                              UserModel userModel = UserModel();

                              // writing all the values

                              userModel.pose =selectedImage!.path.split('/').last;
                              userModel.userName = loggedInUser.userName;
                              userModel.taskNumber = task.toString();
                              await firebaseFirestore
                                  .collection("tournament")
                                  .doc('${user?.uid} pose$task')
                                  .set(userModel.toTask()).then((value) =>
                              selectedImage=null,);

                              task= task+1;
                              timer = 300;
                              if(task==6){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
                              }
                            }
                            else if (message=='T pose' && task==3){
                              StorageModel storage = StorageModel();
                              storage.uploadFileImage(selectedImage!.path,selectedImage!.path.split('/').last);
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              User? user =  FirebaseAuth.instance.currentUser;
                              UserModel userModel = UserModel();

                              // writing all the values

                              userModel.pose =selectedImage!.path.split('/').last;
                              userModel.userName = loggedInUser.userName;
                              userModel.taskNumber = task.toString();
                              await firebaseFirestore
                                  .collection("tournament")
                                  .doc('${user?.uid} pose$task')
                                  .set(userModel.toTask()).then((value) =>
                              selectedImage=null,);

                              task= task+1;
                              timer = 300;
                              if(task==6){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
                              }
                            }
                            else if (message=='triangle pose' && task==4){
                              StorageModel storage = StorageModel();
                              storage.uploadFileImage(selectedImage!.path,selectedImage!.path.split('/').last);
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              User? user =  FirebaseAuth.instance.currentUser;
                              UserModel userModel = UserModel();

                              // writing all the values

                              userModel.pose =selectedImage!.path.split('/').last;
                              userModel.userName = loggedInUser.userName;
                              userModel.taskNumber = task.toString();
                              await firebaseFirestore
                                  .collection("tournament")
                                  .doc('${user?.uid} pose$task')
                                  .set(userModel.toTask()).then((value) =>
                              selectedImage=null,);

                              task= task+1;
                              timer = 300;
                              if(task==6){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
                              }
                            }
                            else if (message=='Butterfly pose' && task==5){
                              StorageModel storage = StorageModel();
                              storage.uploadFileImage(selectedImage!.path,selectedImage!.path.split('/').last);
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              User? user =  FirebaseAuth.instance.currentUser;
                              UserModel userModel = UserModel();

                              // writing all the values

                              userModel.pose =selectedImage!.path.split('/').last;
                              userModel.userName = loggedInUser.userName;
                              userModel.taskNumber = task.toString();
                              await firebaseFirestore
                                  .collection("tournament")
                                  .doc('${user?.uid} pose$task')
                                  .set(userModel.toTask()).then((value) =>
                              selectedImage=null,);

                              task= task+1;
                              timer = 300;
                              if(task==6){
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Player_Result_Screen()));
                              }
                            }
                            else{
                              Fluttertoast.showToast(msg: "Please Enter correct pose");
                            }
                          }
                          else{
                            Fluttertoast.showToast(msg: "Please enter pose first ");
                          }
                        },
                        //selectedImage = null,
                        icon: Icon(
                          Icons.upload_file,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Submit Task",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(showtimer,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
  File? selectedImage;
  Future pickImage(ImageSource source) async {
    final pickedImage =
    await ImagePicker().getImage(source: source , imageQuality: 85);
    selectedImage = File(pickedImage!.path);
    setState(() {
    });
  }
  String? message;
  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://d036-39-32-179-12.in.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!
            .path
            .split("/")
            .last));

    request.headers.addAll(headers);

    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    print(message);
  }
}

//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
