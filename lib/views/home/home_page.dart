// import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/models/month_model.dart';
import 'package:ubenwa_thankgod/core/services/navigator_service.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';
import 'package:quiver/time.dart';
import 'package:ubenwa_thankgod/views/home/utils/overviews.dart';
import 'package:ubenwa_thankgod/widgets/graph.dart';
import 'package:ubenwa_thankgod/widgets/overview_widget.dart';
// import 'package:ubenwa_thankgod/widgets/ubenwa_calendar/ubenwa_calendar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime now = DateTime.now();
  late int selectedMonth = now.month;
  late int selectedDay = now.day;

  ValueNotifier<double> count = ValueNotifier(8.0);

  @override
  Widget build(BuildContext context) {
    int days = daysInMonth(now.year, selectedMonth);
    DateTime lastDayOfMonth = DateTime(now.year, selectedMonth);
    List<MonthModel> months = [
      MonthModel(month: 'Jan', monthNumber: 1),
      MonthModel(month: 'Feb', monthNumber: 2),
      MonthModel(month: 'Mar', monthNumber: 3),
      MonthModel(month: 'Apr', monthNumber: 4),
      MonthModel(month: 'May', monthNumber: 5),
      MonthModel(month: 'Jun', monthNumber: 6),
      MonthModel(month: 'Jul', monthNumber: 7),
      MonthModel(month: 'Aug', monthNumber: 8),
      MonthModel(month: 'Sep', monthNumber: 9),
      MonthModel(month: 'Oct', monthNumber: 10),
      MonthModel(month: 'Nov', monthNumber: 11),
      MonthModel(month: 'Dec', monthNumber: 12),
    ];
    return Scaffold(
      body: Column(
        children: [
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    navigator.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  'Cry Records',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  child: UbenwaAssets.images.svg.notification.svg(),
                )
              ],
            ),
          ),
          const Gap(25),
          SizedBox(
            height: 30,
            width: 370,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...months.map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMonth = e.monthNumber;
                      });
                    },
                    child: SizedBox(
                      width: 50,
                      child: Text(
                        e.month,
                        style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: e.monthNumber == selectedMonth
                                ? FontWeight.w600
                                : FontWeight.w300,
                            color: e.monthNumber == selectedMonth
                                ? lavendarBlue500
                                : gray),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                days,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = index;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 85,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(43),
                              color: index == selectedDay
                                  ? lavendarBlue500
                                  : gray100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              () {
                                final currentDate =
                                    lastDayOfMonth.add(Duration(days: index));
                                final dateName =
                                    DateFormat('E').format(currentDate);
                                return Text(
                                  dateName,
                                  style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: index == selectedDay
                                          ? white
                                          : Colors.black),
                                );
                              }(),
                              Text(
                                "${index + 1}",
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: index == selectedDay
                                        ? white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                        if (index == selectedDay)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 75,
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: yellow500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Today’s Overview",
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w300, color: gray),
                ),
              ],
            ),
          ),
          const Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...overviews.map(
                  (e) => OverviewWidget(
                    header: e.header,
                    count: e.count,
                    commentary: e.commentary,
                    image: e.image,
                    imageBackgroundColor: e.imageBackgroundColor,
                    commentaryColor: e.commentaryColor,
                  ),
                )
              ],
            ),
          ),
          const Gap(26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Hourly Breakdown",
                  style: GoogleFonts.inter(
                      fontSize: 13, fontWeight: FontWeight.w300, color: gray),
                ),
              ],
            ),
          ),
          const Gap(14),
          Container(
            height: 210,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF4476F6), Color(0xFF07236B)],
              ),
            ),
            child: const HourlyBreakDownChart(),
          ),
          const Gap(35),
          SimpleCircularProgressBar(
            backColor: gray100,
            progressColors: const [Color(0xffFCE1A2), Color(0xffDEA00F)],
            maxValue: 12,
            size: 108,
            backStrokeWidth: 25,
            progressStrokeWidth: 25,
            valueNotifier: count,
            mergeMode: true,
            onGetText: (double value) {
              return Text(
                '${value.toInt()}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
