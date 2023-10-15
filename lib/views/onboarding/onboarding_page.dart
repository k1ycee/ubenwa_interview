import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intersperse/intersperse.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/services/navigator_service.dart';
import 'package:ubenwa_thankgod/core/services/storage_service.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';
import 'package:ubenwa_thankgod/views/loading_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  double turns = 0.0;
  int animatedWidgetIndex = 0;

  void _changeRotation() {
    setState(() {
      turns += 1.0 / 4.0;
      animatedWidgetIndex += 1;
    });
  }

  void _reverseRotation() {
    setState(() {
      turns -= 1.0 / 4.0;
      animatedWidgetIndex -= 1;
    });
  }

  List<Widget> animatedWidgets = [
    UbenwaAssets.images.png.sleepingBaby.image(),
    UbenwaAssets.images.png.sadBaby.image(
      height: 166,
      width: 150,
    ),
    UbenwaAssets.images.png.happyBaby.image(height: 176, width: 150),
    UbenwaAssets.images.png.newBornBaby.image(
      height: 176,
      width: 150,
    )
  ];

  @override
  Widget build(BuildContext context) {
    Color indicatorColor = switch (animatedWidgetIndex) {
      0 => yellow50,
      2 => yellow50,
      _ => lavendarBlue50
    };

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            // alignment: Alignment.topCenter,
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: 400,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 35),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: yellow200),
                          child: AnimatedRotation(
                            turns: -turns,
                            duration: const Duration(milliseconds: 100),
                            child: Center(
                              child:
                                  UbenwaAssets.images.png.happyBabyFace.image(),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: lavendarBlue100),
                          child: AnimatedRotation(
                            turns: -turns,
                            duration: const Duration(milliseconds: 100),
                            child: Center(
                              child: UbenwaAssets.images.png.sucklingBabyFace
                                  .image(),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: lavendarBlue100),
                          child: AnimatedRotation(
                            turns: -turns,
                            duration: const Duration(milliseconds: 100),
                            child: Center(
                              child: UbenwaAssets.images.png.cryingBabyFace
                                  .image(),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: yellow200),
                          child: AnimatedRotation(
                            turns: -turns,
                            duration: const Duration(milliseconds: 100),
                            child: Center(
                              child: UbenwaAssets.images.png.smilingBabyFace
                                  .image(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: UbenwaAssets.images.svg.ellipse
                      .svg(color: indicatorColor),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInBack,
                    duration: const Duration(milliseconds: 500),
                    child: animatedWidgets.elementAt(animatedWidgetIndex),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 430,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  4,
                  (index) => index,
                )
                    .map<Widget>(
                      (e) => Container(
                        height: 5,
                        width: e == animatedWidgetIndex ? 16 : 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: switch (e) {
                            0 => e == animatedWidgetIndex ? yellow500 : gray200,
                            1 => e == animatedWidgetIndex
                                ? lavendarBlue500
                                : gray200,
                            2 => e == animatedWidgetIndex ? yellow500 : gray200,
                            3 => e == animatedWidgetIndex
                                ? lavendarBlue500
                                : gray200,
                            _ => gray200,
                          },
                        ),
                      ),
                    )
                    .intersperse(const Gap(3)),
              ],
            ),
          ),
          Positioned(
            bottom: 270,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: switch (animatedWidgetIndex) {
                0 => Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to a New Mothering Experince',
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(13),
                      Text(
                        'Now you can understand a lot about your new born, bukkle up for an experince you will always long for.',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                1 => Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'A Cry with Meaning',
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(13),
                      Text(
                        'Now with great feedbacks, you can understand a lot about your new born cry patter and prepare for common cry peak period.',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                2 => Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Analytical Insight',
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(13),
                      Text(
                        'Be your baby’s doctor by viewing great insight and analysis; you get to see how your baby cry activity varies in terms of duration and frequency to help you make good decisions',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                3 => Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Happy Mom \nHappy Home',
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(13),
                      Text(
                        'Reduce you baby crying time whilst gettting your schedule back together by planning for time of cry activity and time of quite.',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                _ => const SizedBox.shrink()
              },
            ),
          ),
          if(animatedWidgetIndex == 3) Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  navigator.pushTo(const LoadingPage());
                  StorageService.saveIsOnboarded(true);
                },
                child: Container(
                  height: 58,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lavendarBlue500),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w600, color: white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: switch (animatedWidgetIndex) {
                0 => Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          _changeRotation();
                        },
                        child: Text(
                          'Show me How',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: lavendarBlue500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                1 => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _reverseRotation();
                        },
                        child: Text(
                          'Previous',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: gray200),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _changeRotation();
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: lavendarBlue500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                2 => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _reverseRotation();
                        },
                        child: Text(
                          'Previous',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: gray200),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _changeRotation();
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: lavendarBlue500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                3 => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _reverseRotation();
                        },
                        child: Text(
                          'Previous',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: gray200),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                _ => const SizedBox.shrink()
              },
            ),
          ),
        ],
      ),
    );
  }
}
