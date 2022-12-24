//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:act_my_pose/screens/audience_profike_screen.dart';
import 'package:act_my_pose/screens/audience_result_screen.dart';
import 'package:act_my_pose/screens/audience_view_task_screen.dart';
import 'package:act_my_pose/screens/audience_vote_screen.dart';
import 'package:act_my_pose/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Audience_Dashboard_Screen extends StatefulWidget {
  const Audience_Dashboard_Screen({Key? key}) : super(key: key);

  @override
  State<Audience_Dashboard_Screen> createState() =>
      _Audience_Dashboard_ScreenState();
}

class _Audience_Dashboard_ScreenState extends State<Audience_Dashboard_Screen> {
  List<String> items = [
    "Islamabad",
    "Lahore",
    "Karachi",
    "Faisalabad",
    "Multan"
  ];
  String? selected_item = "Islamabad";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf201A30),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  backgroundColor: Color(0XFF0DF5E3),
                  child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AudienceProfileScreen()));
                  }
                      , icon: const Image(
                        image: AssetImage(
                          "assets/icon_profile.png",
                        ),
                        color: Colors.white,
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  backgroundColor: Color(0XFF0DF5E3),
                  child: IconButton(onPressed: ()async{
                    await FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen())));

                  }
                      , icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            children: List.generate(150~/10, (index) => Expanded(
              child: Container(
                color: Colors.grey,
                height: 2,
              ),
            )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width*1,
            child: Image(
              image: AssetImage(
                "assets/logo.png",
              ),
              color: Colors.white,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: Color(0XFF0DF5E3),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButton<String>(
                elevation: 5,
                iconDisabledColor: Color(0XFF0DF5E3),
                iconEnabledColor: Colors.white,
                borderRadius: BorderRadius.circular(12.0),

                  focusColor: Color(0XFF0DF5E3),
                  dropdownColor: Color(0XFF0DF5E3),
                  value: selected_item,
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 20 , color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (item) => setState(() {
                    selected_item = item;
                  })),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white)),
            elevation: 5,
            color: const Color(0XFF0DF5E3),
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20 ,15 ,20 ,15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const AudiendeViewTaskScreen()));
                },
                child: Text(
                  "View Tasks",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white)),
            elevation: 5,
            color: const Color(0XFF0DF5E3),
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(50 , 10 , 50 , 10),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Vote_Screen()));
                },
                child: Text(
                  "Vote",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white)),
            elevation: 5,
            color: const Color(0XFF0DF5E3),
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(38 , 10 , 38 , 10),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Audience_Result_Screen()));
                },
                child: Text(
                  "Results",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
