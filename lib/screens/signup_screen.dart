import 'package:act_my_pose/screens/result_screen.dart';
import 'package:act_my_pose/screens/vote_screen.dart';
import 'package:act_my_pose/screens/waiting_screen.dart';
import 'package:act_my_pose/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        userNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final ageField = TextFormField(
      autofocus: false,
      controller: ageController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        ageController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final countryField = TextFormField(
      autofocus: false,
      controller: countryController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        countryController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final cityField = TextFormField(
      autofocus: false,
      controller: cityController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        cityController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
    final addressField = TextFormField(
      autofocus: false,
      controller: addressController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0XFF0DF5E3),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
        color: Color(0xFf201A30),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: 150,
                ),
                Column(
                  children: [
                    Text(
                      'SIGNUP FORM',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EMAIL ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: emailField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "USERNAME  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: userNameField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PASSWORD  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: passwordField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CONFIRM\nPASSWORD  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: confirmPasswordField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AGE  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: ageField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "COUNTRY  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: countryField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CITY  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: cityField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ADDRESS  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: addressField,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0XFF0DF5E3),
                          child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                            minWidth: MediaQuery.of(context).size.width * 0.2,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Vote_Screen()));
                            },
                            child: Text(
                              "AS A\nAUDIENCE",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0XFF0DF5E3),
                          child: MaterialButton(
                            padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
                            minWidth: MediaQuery.of(context).size.width * 0.2,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaitingScreen()));
                            },
                            child: Text(
                              "AS A\nPLAYER",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
