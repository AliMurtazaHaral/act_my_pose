//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:act_my_pose/screens/player_prize_list_screen.dart';
import 'package:act_my_pose/screens/audience_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const Vote_Screen());

class Vote_Screen extends StatelessWidget {
  const Vote_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf201A30),
      appBar: AppBar(
        title: Text("Vote a Player"),
        backgroundColor: const Color(0XFF0DF5E3),
      ),
      body:

      Center(
          child: Column(
        children: [
          Image(image: AssetImage("assets/logo.png")),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Player 1" , style: TextStyle(color: Color(0XFF0DF5E3)),),
                Text("Player 2" , style: TextStyle(color: Color(0XFF0DF5E3))),
                Text("Player 3" , style: TextStyle(color: Color(0XFF0DF5E3))),
                Text("Player 4" , style: TextStyle(color: Color(0XFF0DF5E3))),
                Text("Player 5" , style: TextStyle(color: Color(0XFF0DF5E3))),
              ],
            ),
          ),
          Votees(Player: "Task 1"),
          Votees(Player: "Task 2"),
          Votees(Player: "Task 3"),
          Votees(Player: "Task 4"),
          Votees(Player: "Task 5"),

          TextButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0XFF0DF5E3))),
            // onPressed:
            // uploadImage,
            onPressed: () async {
              Fluttertoast.showToast(msg: "Votes added successfully");
              Navigator.pop(context);

            },

            //selectedImage = null,
            icon: Icon(
              Icons.text_rotation_none_rounded,
              color: Colors.white,
            ),
            label: Text(
              "Submit Votes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}

class Votees extends StatefulWidget {
  String Player;
  Votees({Key? key, required this.Player}) : super(key: key);

  @override
  State<Votees> createState() => _VoteesState();
}

class _VoteesState extends State<Votees> {
  bool isChecked0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  double width = 10.0;
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.Player,
          style: TextStyle(color: const Color(0XFF0DF5E3)),
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked0,
          onChanged: (bool? value) {
            setState(() {
              isChecked0 = value!;
              if(isChecked0 == true){
                isChecked1 = false;
                isChecked2 = false;
                isChecked3 = false;
                isChecked4 = false;
              }
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked1,
          onChanged: (bool? value) {
            setState(() {
              isChecked1 = value!;
              if(isChecked1 == true){
                isChecked0 = false;
                isChecked2 = false;
                isChecked3 = false;
                isChecked4 = false;
              }
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked2,
          onChanged: (bool? value) {
            setState(() {
              isChecked2 = value!;
              if(isChecked2 == true){
                isChecked1 = false;
                isChecked0 = false;
                isChecked3 = false;
                isChecked4 = false;
              }
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked3,
          onChanged: (bool? value) {
            setState(() {
              isChecked3 = value!;
              if(isChecked3 == true){
                isChecked1 = false;
                isChecked2 = false;
                isChecked0 = false;
                isChecked4 = false;
              }
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked4,
          onChanged: (bool? value) {
            setState(() {
              isChecked4 = value!;
              if(isChecked4 == true){
                isChecked1 = false;
                isChecked2 = false;
                isChecked3 = false;
                isChecked0 = false;
              }
            });
          },
        ),
      ],
    );
  }
}
