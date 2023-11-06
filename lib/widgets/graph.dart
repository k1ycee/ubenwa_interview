import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';

/// TODO: All commented code are left behind because the can be reactivated to extend class functionality
/// TODO: Example animated tooltip
class HourlyBreakDownChart extends StatefulWidget {
  const HourlyBreakDownChart({super.key});

  final Color barBackgroundColor = white;
  final Color barColor = white;
  final Color touchedBarColor = green;

  @override
  State<StatefulWidget> createState() => HourlyBreakDownChartState();
}

class HourlyBreakDownChartState extends State<HourlyBreakDownChart> {
  // final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  // bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 11),
      child: BarChart(
        mainBarData(),
        // swapAnimationDuration: animDuration,
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 7,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: lavendarBlue500)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Color(0x5405226f),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  final data = [
    2.0,
    5.0,
    4.0,
    2.5,
    3.0,
    3.0,
    2.0,
    5.0,
    4.0,
    2.5,
    3.0,
    3.0,
  ];

  List<BarChartGroupData> showingGroups(List<dynamic> data) {
    return data.map((e) => makeGroupData(e.toInt(), e)).toList();
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(data),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: white,
      // fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;

    List<String> timeRanges = List.generate(12, (index) {
      int startHour = index * 2;
      int endHour = startHour + 2;
      String timeRange = '$startHour:00/\n$endHour:00';
      return timeRange;
    });

    int intValue = value.toInt();

    if (intValue >= 0 && intValue < timeRanges.length) {
      text = Text(timeRanges[intValue], style: style);
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  List<Widget> text = [];
}
