//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:act_my_pose/screens/prize_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Prize_List_Screen());

class Prize_List_Screen extends StatelessWidget {
  const Prize_List_Screen({super.key});

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
          Image(image: AssetImage("assets/logo.png"), color: Colors.cyan),
          Text(
            "Prize List",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: const Color(0XFF0DF5E3),
            ),
          ),
          Prize(Player: "Watch      "),
          Prize(Player: "Phone      "),
          Prize(Player: "Bike          "),
          Prize(Player: "Laptop     "),
          Prize(Player: "Money     "),
          TextButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0XFF0DF5E3))),
            // onPressed:
            // uploadImage,
            onPressed: () async {
              Navigator.pop(context);
            },

            //selectedImage = null,
            icon: Icon(
              Icons.subdirectory_arrow_left,
              color: Colors.white,
            ),
            label: Text(
              "Thankyou",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}

class Prize extends StatefulWidget {
  String Player;
  Prize({Key? key, required this.Player}) : super(key: key);

  @override
  State<Prize> createState() => _PrizeState();
}

class _PrizeState extends State<Prize> {
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

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Text(
            widget.Player,
            style: TextStyle(color: const Color(0XFF0DF5E3)),
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
      ),
    );
  }
}
