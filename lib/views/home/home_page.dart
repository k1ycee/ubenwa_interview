import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/models/month_model.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';
import 'package:quiver/time.dart';
import 'package:ubenwa_thankgod/views/home/utils/overviews.dart';
import 'package:ubenwa_thankgod/widgets/graph.dart';
import 'package:ubenwa_thankgod/widgets/overview_widget.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // navigator.pop();
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
              child:
              ListView(
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
                  days ,
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
            const Gap(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 194,
                    width: 171,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: lavendaarBlue800,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 11, left: 8, right: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: yellow400),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: UbenwaAssets.images.svg.star.svg(),
                                ),
                              ),
                              const Gap(6),
                              Text(
                                'Daily Challenge',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(14),
                        SimpleCircularProgressBar(
                          backColor: gray100,
                          progressColors: const [
                            Color(0xffFCE1A2),
                            Color(0xffDEA00F)
                          ],
                          maxValue: 12,
                          size: 108,
                          backStrokeWidth: 25,
                          progressStrokeWidth: 25,
                          valueNotifier: count,
                          mergeMode: true,
                          onGetText: (double value) {
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${value.toInt()}\n',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' out of 12\nhours of silence',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 6,
      
                                      fontWeight: FontWeight.w400,
                                      // height: 1.50,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 194,
                    width: 171,
                    decoration: BoxDecoration(
                      color: lavendarBlue500,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UbenwaAssets.images.png.fullSizeSucklingBaby.image(),
                        Text(
                          'Next Predicted Cry',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: gray100,
                          ),
                        ),
                        Text(
                          '12:40 - 14:30',
                          style: GoogleFonts.inter(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: yellow400,
                          ),
                        ),
                        const Gap(9),
                        Container(
                          width: 100,
                          height: 23,
                          decoration: BoxDecoration(
                            color: const Color(0xb5ffffff),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Set Alarm',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: lavendaarBlue800,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
