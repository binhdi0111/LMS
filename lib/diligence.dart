import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyDiligence extends StatefulWidget {
  const MyDiligence({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Diligence();
  }
}

class Diligence extends State<MyDiligence> {
  List<_ChartDataColumn>? _chartDataColumn;
  List<ChartDataLine>? _chartDataLine;
  TooltipBehavior? _tooltip;
  @override
  void initState() {
    _chartDataColumn = [
      _ChartDataColumn('Tháng 8', 90, const Color.fromRGBO(118, 137, 169, 1)),
      _ChartDataColumn('Tháng 9', 75, const Color.fromRGBO(72, 98, 141, 1)),
      _ChartDataColumn('Tháng 10', 100, const Color.fromRGBO(118, 137, 169, 1)),
      _ChartDataColumn('Tháng 11', 95, const Color.fromRGBO(72, 98, 141, 1)),
      _ChartDataColumn('Tháng 12', 80, const Color.fromRGBO(118, 137, 169, 1))
    ];
    _chartDataLine = [
      ChartDataLine(2010, 50),
      ChartDataLine(2011, 40),
      ChartDataLine(2012, 60),
      ChartDataLine(2013, 55),
      ChartDataLine(2014, 45)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/Images/imageProfile.png"),
              ),
              title: Text(
                "Đặng Văn Bình",
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1)),
              ),
              subtitle: Text(
                "lớp 12A2",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(133, 133, 133, 1)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Text("Thông Tin Cá Nhân",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(26, 26, 26, 1))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  const Text("Mã học sinh",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                  Expanded(child: Container()),
                  const Text("20182379",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  const Text("Ngày sinh",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                  Expanded(child: Container()),
                  const Text("01 Thg 11,2000",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  const Text("Số điện thoại",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                  Expanded(child: Container()),
                  const Text("0969804506",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  const Text("Email",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(133, 133, 133, 1))),
                  Expanded(child: Container()),
                  const Text("binhbka0111@gmail.com",
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 20),
              child: const Text("Chuyên cần",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(26, 26, 26, 1))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 20),
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 100,
                      interval: 10,
                      majorGridLines: const MajorGridLines(width: 0)),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<_ChartDataColumn, String>>[
                    ColumnSeries<_ChartDataColumn, String>(
                      dataSource: _chartDataColumn!,
                      xValueMapper: (_ChartDataColumn data, _) => data.x,
                      yValueMapper: (_ChartDataColumn data, _) => data.y,
                      name: 'Gold',
                      pointColorMapper: (_ChartDataColumn data, _) =>
                          data.color,
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 158,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: SfCartesianChart(
                              primaryXAxis: NumericAxis(
                                isVisible: false,
                                //Hide the gridlines of x-axis
                                majorGridLines: const MajorGridLines(width: 0),
                                //Hide the axis line of x-axis
                                axisLine: const AxisLine(width: 0),
                                minorGridLines: const MinorGridLines(width: 0),

                              ),
                              primaryYAxis: NumericAxis(
                                  minimum: 0,
                                  maximum: 100,
                                  isVisible: false,

                                  //Hide the gridlines of y-axis
                                  majorGridLines: const MajorGridLines(width: 0),
                                  //Hide the axis line of y-axis
                                  axisLine: const AxisLine(width: 0)
                              ),


                              series: <ChartSeries>[
                                // Renders line chart
                                LineSeries<ChartDataLine, int>(

                                  dataSource: _chartDataLine!,
                                  xValueMapper: (ChartDataLine data, _) => data.x,
                                  yValueMapper: (ChartDataLine data, _) => data.y,
                                  color: const Color.fromRGBO(248, 129, 37, 1),

                                )
                              ]),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1),width: 1))),
                          child: Row(),),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
                          child: Row(
                            children: [
                              const Text("Môn học",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(133, 133, 133, 1))),
                              Expanded(child: Container()),
                              const Text("12",
                                  style: TextStyle(
                                      fontSize: 12, color: Color.fromRGBO(26, 26, 26, 1)))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
                          child: Row(
                            children: [
                              const Text("Điểm danh",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(133, 133, 133, 1))),
                              Expanded(child: Container()),
                              const Text("99",
                                  style: TextStyle(
                                      fontSize: 12, color: Color.fromRGBO(26, 26, 26, 1)))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 16, right: 16, top: 10,bottom: 20),
                          child: Row(
                            children: [
                              const Text("Vắng",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(133, 133, 133, 1))),
                              Expanded(child: Container()),
                              const Text("21",
                                  style: TextStyle(
                                      fontSize: 12, color: Color.fromRGBO(255, 69, 89, 1)))
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class _ChartDataColumn {
  _ChartDataColumn(this.x, this.y, this.color);
  final Color? color;
  final String x;
  final double y;
}

class ChartDataLine {
  ChartDataLine(this.x, this.y);
  final int x;
  final double y;
}
