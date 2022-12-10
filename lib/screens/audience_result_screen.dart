//bg color: Color(0xFf201A30)
// button color: const Color(0XFF0DF5E3)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Audience_Result_Screen extends StatefulWidget {
  const Audience_Result_Screen({Key? key}) : super(key: key);

  @override
  State<Audience_Result_Screen> createState() => _Audience_Result_ScreenState();
}

class _Audience_Result_ScreenState extends State<Audience_Result_Screen> {
  List<ChartData> data = [
    ChartData(1, 35),
    ChartData(2, 28),
    ChartData(3, 34),
    ChartData(4, 32),
    ChartData(5, 40)
  ];
  List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 1, y: 30),
    ChartSampleData(x: 2, y: 25),
    ChartSampleData(x: 3, y: 20),
    ChartSampleData(x: 4, y: 35),
    ChartSampleData(x: 5, y: 40),
    ChartSampleData(x: 6, y: 45),
  ];

  @override
  Widget build(BuildContext context) {
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
                "P5 WINS",
                style: TextStyle(
                    color: const Color(0XFF0DF5E3),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
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
