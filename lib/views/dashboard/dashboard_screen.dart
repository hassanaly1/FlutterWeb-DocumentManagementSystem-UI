// ignore_for_file: non_constant_identifier_names

import 'package:document_management_web/views/dashboard/components/custom_analytics_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<_ChartData> data;

  //late TooltipBehavior _tooltip;

  final List<PieChartData> chartData = [
    PieChartData('David', 1),
    PieChartData('Steve', 3),
    PieChartData('Jack', 7),
    PieChartData('Others', 10)
  ];
  late List<_ChartData> _chartData;

  @override
  void initState() {
    _chartData = <_ChartData>[
      _ChartData('Food', 55, 40, 45, 48),
      _ChartData('Transport', 33, 45, 54, 28),
      _ChartData('Medical', 43, 23, 20, 34),
      _ChartData('Clothes', 32, 54, 23, 54),
      _ChartData('Books', 56, 18, 43, 55),
      _ChartData('Others', 23, 54, 33, 56),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: const BorderRadius.all(Radius.circular(16.0))),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 15.0,
                    children: [
                      PieChart(),
                      _buildStackedLine100Chart(),
                      RadialBar(),
                      // Container(
                      //   height: 300,
                      //   width: 600,
                      //   decoration: const BoxDecoration(
                      //     color: Colors.transparent,
                      //   ),
                      //   child: SizedBox(
                      //       height: 100,
                      //       child: SfCartesianChart(
                      //           primaryXAxis: CategoryAxis(),
                      //           primaryYAxis: NumericAxis(
                      //               minimum: 0, maximum: 40, interval: 10),
                      //           tooltipBehavior: _tooltip,
                      //           series: <ChartSeries<_ChartData, String>>[
                      //             BarSeries<_ChartData, String>(
                      //                 dataSource: data,
                      //                 xValueMapper: (_ChartData data, _) =>
                      //                     data.x,
                      //                 yValueMapper: (_ChartData data, _) =>
                      //                     data.y,
                      //                 name: 'Gold',
                      //                 color: const Color.fromRGBO(8, 142, 255, 1))
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(
                  child: Wrap(
                    children: [
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Users',
                          analyticsValue: '42',
                          analyticsPercentage: '10',
                          icon: Icons.arrow_upward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Documents',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Completed',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Recieved',
                          analyticsValue: '12',
                          analyticsPercentage: '33',
                          icon: Icons.arrow_upward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Archieve',
                          analyticsValue: '452',
                          analyticsPercentage: '25',
                          icon: Icons.arrow_upward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Users',
                          analyticsValue: '42',
                          analyticsPercentage: '10',
                          icon: Icons.arrow_upward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Documents',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Completed',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Recieved',
                          analyticsValue: '12',
                          analyticsPercentage: '33',
                          icon: Icons.arrow_upward_outlined),
                      CustomAnalyticsContainer(
                          analyticsType: 'Total Archieve',
                          analyticsValue: '452',
                          analyticsPercentage: '25',
                          icon: Icons.arrow_upward_outlined),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Container RadialBar() {
    return Container(
      height: context.height * 0.4,
      width: context.width * 0.2,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
          height: 100,
          child: SfCircularChart(series: <CircularSeries>[
            RadialBarSeries<PieChartData, String>(
                enableTooltip: true,
                dataSource: chartData,
                xValueMapper: (PieChartData data, _) => data.x,
                yValueMapper: (PieChartData data, _) => data.y)
          ])),
    );
  }

  Container PieChart() {
    return Container(
      height: context.height * 0.4,
      width: context.width * 0.2,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
        height: 100,
        child: SfCircularChart(series: <CircularSeries>[
          PieSeries<PieChartData, String>(
            dataSource: chartData,
            pointColorMapper: (PieChartData data, _) => data.color,
            xValueMapper: (PieChartData data, _) => data.x,
            yValueMapper: (PieChartData data, _) => data.y,
          ),
        ]),
      ),
    );
  }

  /// Returns the cartesian stacked line 100 chart.
  Container _buildStackedLine100Chart() {
    return Container(
      height: context.height * 0.4,
      width: context.width * 0.4,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Monthly expense of a family'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelRotation: -45,
        ),
        primaryYAxis: NumericAxis(
            rangePadding: ChartRangePadding.none,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getStackedLine100Series(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  /// Returns the list of char series
  /// which need to render on the stacked line 100 chart.
  List<ChartSeries<_ChartData, String>> _getStackedLine100Series() {
    return <ChartSeries<_ChartData, String>>[
      StackedLine100Series<_ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.father,
          name: 'Father',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.mother,
          name: 'Mother',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.son,
          name: 'Son',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.daughter,
          name: 'Daughter',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class PieChartData {
  PieChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class _ChartData {
  _ChartData(this.x, this.father, this.mother, this.son, this.daughter);
  final String x;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}
