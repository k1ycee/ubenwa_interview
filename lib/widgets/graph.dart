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

  List<BarChartGroupData> showingGroups() => List.generate(12, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 2, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 2, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 1.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 3, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 1, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          case 9:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          case 10:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          case 11:
            return makeGroupData(6, 0.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      // barTouchData: BarTouchData(
      //   touchTooltipData: BarTouchTooltipData(
      //     tooltipBgColor: white,
      //     tooltipHorizontalAlignment: FLHorizontalAlignment.right,
      //     tooltipMargin: -10,
      //     getTooltipItem: (group, groupIndex, rod, rodIndex) {
      //       String weekDay;
      //       switch (group.x) {
      //         case 0:
      //           weekDay = 'Mo';
      //           break;
      //         case 1:
      //           weekDay = 'Tuesday';
      //           break;
      //         case 2:
      //           weekDay = 'Wednesday';
      //           break;
      //         case 3:
      //           weekDay = 'Thursday';
      //           break;
      //         case 4:
      //           weekDay = 'Friday';
      //           break;
      //         case 5:
      //           weekDay = 'Saturday';
      //           break;
      //         case 6:
      //           weekDay = 'Sunday';
      //           break;
      //         default:
      //           throw Error();
      //       }
      //       return BarTooltipItem(
      //         '$weekDay\n',
      //         const TextStyle(
      //           color: lavendarBlue500,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 8,
      //         ),
      //         children: <TextSpan>[
      //           TextSpan(
      //             text: (rod.toY - 1).toString(),
      //             style: const TextStyle(
      //               color: lavendarBlue500,
      //               fontSize: 8,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      //   touchCallback: (FlTouchEvent event, barTouchResponse) {
      //     setState(() {
      //       if (!event.isInterestedForInteractions ||
      //           barTouchResponse == null ||
      //           barTouchResponse.spot == null) {
      //         touchedIndex = -1;
      //         return;
      //       }
      //       touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
      //     });
      //   },
      // ),
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

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: white,
      // fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('00:00/\n02:00', style: style);
        break;
      case 1:
        text = const Text('02:00/\n04:00', style: style);
        break;
      case 2:
        text = const Text('04:00/\n06:00', style: style);
        break;
      case 3:
        text = const Text('06:00/\n08:00', style: style);
        break;
      case 4:
        text = const Text('08:00/\n010:00', style: style);
        break;
      case 5:
        text = const Text('10:00/\n12:00', style: style);
        break;
      case 6:
        text = const Text('12:00/\n14:00', style: style);
        break;

      case 7:
        text = const Text('14:00/\n16:00', style: style);
        break;
      case 8:
        text = const Text('16:00/\n18:00', style: style);
        break;
      case 9:
        text = const Text('18:00/\n20:00', style: style);
        break;
      case 10:
        text = const Text('20:00/\n22:00', style: style);
      case 11:
        text = const Text('22:00/\n24:00', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     barTouchData: BarTouchData(
  //       enabled: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: getTitles,
  //           reservedSize: 38,
  //         ),
  //       ),
  //       leftTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(7, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(
  //             0,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 1:
  //           return makeGroupData(
  //             1,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 2:
  //           return makeGroupData(
  //             2,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 3:
  //           return makeGroupData(
  //             3,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 4:
  //           return makeGroupData(
  //             4,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 5:
  //           return makeGroupData(
  //             5,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         case 6:
  //           return makeGroupData(
  //             6,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: white,
  //           );
  //         default:
  //           return throw Error();
  //       }
  //     }),
  //     gridData: const FlGridData(show: false),
  //   );
  // }

  // Future<dynamic> refreshState() async {
  //   setState(() {});
  //   await Future<dynamic>.delayed(
  //     animDuration + const Duration(milliseconds: 50),
  //   );
  //   if (isPlaying) {
  //     await refreshState();
  //   }
  // }
}
