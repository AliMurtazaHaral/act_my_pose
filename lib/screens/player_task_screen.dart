//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'dart:io';
import 'package:act_my_pose/model/storage_model.dart';
import 'package:act_my_pose/screens/audience_result_screen.dart';
import 'package:act_my_pose/screens/player_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';
class Player_Task_Screen extends StatefulWidget {
  const Player_Task_Screen({Key? key}) : super(key: key);

  @override
  State<Player_Task_Screen> createState() => _Player_Task_ScreenState();
}

class _Player_Task_ScreenState extends State<Player_Task_Screen> {
  late Reference getUrl;
  Random random = new Random();
   // from 0 upto 99 included
  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(5)+1;
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
                      const Text(
                        "Task 1",
                        style: TextStyle(
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
                      Image(
                        image: AssetImage(
                          "assets/pose${randomNumber}.png",
                        ),
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
                          StorageModel storage = StorageModel();
                          final result = await FilePicker.platform.pickFiles(
                            allowMultiple: false,
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'png'],
                          );
                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('no file selected'),
                              ),
                            );
                          } else {
                            final path = result?.files.single.path;
                            final fileName = 'pose$randomNumber';
                            storage
                                .uploadFileImage(path, fileName)
                                .then((value) => const SnackBar(
                              content: Text("FIle Has been uploaded successfully"),
                            ));
                            getUrl = FirebaseStorage.instance.ref().child(fileName!);

                          }
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
                          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                          User? user =  FirebaseAuth.instance.currentUser;
                          UserModel userModel = UserModel();

                          // writing all the values

                          userModel.pose =getUrl.fullPath;
                          await firebaseFirestore
                              .collection("users")
                              .doc(user?.uid).collection('pose$randomNumber').doc("imgRef")
                              .set(userModel.toTask()).then((value) =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Player_Result_Screen(),),),);

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
}

//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
