import 'package:act_my_pose/screens/player_prize_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Player_Result_Screen extends StatefulWidget {
  Player_Result_Screen({Key? key,required this.firstP,required this.secondP}) : super(key: key);
  int? firstP;
  int? secondP;
  @override
  State<Player_Result_Screen> createState() => _Player_Result_ScreenState();
}

class _Player_Result_ScreenState extends State<Player_Result_Screen> {


  @override
  Widget build(BuildContext context) {
    List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 1, y: widget.firstP!.toDouble()),
      ChartSampleData(x: 2, y: widget.secondP!.toDouble()),
    ];
    return Container(
        constraints: const BoxConstraints.expand(),
        color: Color(0xFf201A30),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(
                  "assets/logo.png",
                ),
                height: 200,
              ),
              Text(
                "RESULTS",
                style: TextStyle(
                  color: const Color(0XFF0DF5E3),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SfCartesianChart(
                series: <ColumnSeries<ChartSampleData, double>>[
                  ColumnSeries<ChartSampleData, double>(
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: const Color(0XFF0DF5E3),
                    dataSource: chartData,
                    xValueMapper: (ChartSampleData sales, _) => sales.x,
                    yValueMapper: (ChartSampleData sales, _) => sales.y,
                  ),
                ],
              ),
              Text(
                "YOU WIN",
                style: TextStyle(
                    color: const Color(0XFF0DF5E3),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
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
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Player_Prize_List_Screen()));
                    },
                    child: Text(
                      "View Rewards",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ));
  }
}
class ChartSampleData {
  ChartSampleData({required this.x, required this.y});
  final double x;
  final double y;
}

class ChartData {
  ChartData(this.number, this.score);

  final double number;
  final double score;
}