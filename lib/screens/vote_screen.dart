//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:act_my_pose/screens/prize_list_screen.dart';
import 'package:flutter/material.dart';

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
      body: Center(
          child: Column(
        children: [
          Image(image: AssetImage("assets/logo.png")),
          Votees(Player: "Player 1"),
          Votees(Player: "Player 2"),
          Votees(Player: "Player 3"),
          Votees(Player: "Player 4"),
          Votees(Player: "Player 5"),
          TextButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0XFF0DF5E3))),
            // onPressed:
            // uploadImage,
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Prize_List_Screen()));
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
  bool isChecked = false;
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
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        SizedBox(
          width: width,
        ),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ],
    );
  }
}
