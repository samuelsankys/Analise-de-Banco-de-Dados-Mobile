import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GraficoResult extends StatefulWidget {
  const GraficoResult(
      {Key? key, required this.tituloDataBase, required this.data})
      : super(key: key);

  final String tituloDataBase;
  final Map<String, double> data;

  @override
  State<GraficoResult> createState() => _GraficoResultState();
}

class _GraficoResultState extends State<GraficoResult> {
  double numMaior = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.data['sqlite'] != null && widget.data['sqlite']! > numMaior) {
      numMaior = widget.data['sqlite']!;
    }
    if (widget.data['couchbase'] != null &&
        widget.data['couchbase']! > numMaior) {
      numMaior = widget.data['couchbase']!;
    }
    if (widget.data['hive'] != null && widget.data['hive']! > numMaior) {
      numMaior = widget.data['hive']!;
    }
    if (widget.data['objectbox'] != null &&
        widget.data['objectbox']! > numMaior) {
      numMaior = widget.data['objectbox']!;
    }
    if (widget.data['sembast'] != null && widget.data['sembast']! > numMaior) {
      numMaior = widget.data['sembast']!;
    }
    print(numMaior);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  widget.tituloDataBase,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
          Divider(),

          // CalculadoResult(
          //     dataInsert: mediaInsert,
          //     dataSelect: mediaSelect,
          //     dataUpdate: mediaUpdate,
          //     dataDelete: mediaDelete),
          AspectRatio(
            aspectRatio: 1,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: numMaior + (numMaior * 0.1),
                minY: 0,
                groupsSpace: 20,
                //rangeAnnotations: RangeAnnotations( horizontalRangeAnnotations: [HorizontalRangeAnnotation(y1: 0.00000, y2: 0.3)],),
                borderData: FlBorderData(show: false ),
                barTouchData: BarTouchData(enabled: true,touchTooltipData: BarTouchTooltipData(tooltipBgColor: Colors.white)),
                gridData: FlGridData(show: false, verticalInterval: 0.001),
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                          toY: widget.data['sqlite'] != null
                              ? widget.data['sqlite']!
                              : 0.0,
                          color: Colors.blueGrey[600],
                          width: 20)
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                          toY: widget.data['couchbase'] != null
                              ? widget.data['couchbase']!
                              : 0.0,
                          color: Colors.red,
                          width: 20)
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                          toY: widget.data['hive'] != null
                              ? widget.data['hive']!
                              : 0.0,
                          color: Colors.pink[600],
                          width: 20)
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                          toY: widget.data['objectbox'] != null
                              ? widget.data['objectbox']!
                              : 0.0,
                          color: Colors.greenAccent[600],
                          width: 20)
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                          toY: widget.data['sembast'] != null
                              ? widget.data['sembast']!
                              : 0.0,
                          color: Colors.deepPurple[600],
                          width: 20)
                    ],
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 150),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        ],
      ),
    );
  }
}
