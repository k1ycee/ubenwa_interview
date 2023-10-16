import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/services/navigator_service.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';
import 'package:ubenwa_thankgod/views/home/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late AnimationController splashAnimationController;

  late Animation<Offset> animation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 40))
          .animate(animationController);

  late Animation<double> splashAnimation = CurvedAnimation(
      parent: splashAnimationController, curve: Curves.decelerate);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    splashAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
        splashAnimationController.forward();
      }
    });

    Timer(const Duration(milliseconds: 1550), () {
      navigator.pushTo(const Homepage());
    });
    super.initState();
  }

  @override
  void dispose() {
    splashAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lavendarBlue500,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: animation,
              child: UbenwaAssets.images.svg.milkDrop.svg(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: UbenwaAssets.images.png.babyBottle.image(),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 230,
              height: 48,
              child: Text(
                'Please wait while we gather your Baby’s data...',
                style: GoogleFonts.inter(fontSize: 18, color: white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: UbenwaAssets.images.png.milkWave.image(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizeTransition(
              sizeFactor: splashAnimation,
              axis: Axis.vertical,
              axisAlignment: 0.0,
              child: UbenwaAssets.images.png.milkSplash.image(),
            ),
          ),
        ],
      ),
    );
  }
}
