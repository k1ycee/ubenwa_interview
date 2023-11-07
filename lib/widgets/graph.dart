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
    (
      0,
      2.0,
    ),
    (
      1,
      2.0,
    ),
    (
      2,
      2.0,
    ),
    (
      3,
      2.0,
    ),
    (
      4,
      2.0,
    ),
    (
      5,
      2.0,
    ),
    (
      6,
      2.0,
    ),
    (
      7,
      2.0,
    ),
    (
      8,
      2.0,
    ),
    (
      9,
      2.0,
    ),
    (
      10,
      2.0,
    ),
    (
      11,
      2.0,
    ),
  ];

  List<BarChartGroupData> showingGroups() {
    return data.map((e) => makeGroupData(e.$1, e.$2)).toList();
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
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(
    double value,
    TitleMeta meta,
  ) {
    const style = TextStyle(
      color: white,
      fontSize: 8,
    );
    Widget text;
    int intValue = value.toInt();

    int startHour = intValue * 2;
    int endHour = startHour + 2;
    String timeRange = '$startHour:00/\n$endHour:00';

    if (intValue >= 0) {
      text = Text(timeRange, style: style);
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
