import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/services/navigator_service.dart';
import 'package:ubenwa_thankgod/core/services/storage_service.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';
import 'package:ubenwa_thankgod/views/home/home_page.dart';
import 'package:ubenwa_thankgod/views/onboarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (StorageService.isOnboarded) {
        navigator.pushTo(const Homepage());
      } else {
        navigator.pushTo(const OnboardingPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: lavendarBlue500,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UbenwaAssets.images.svg.appIcon.svg(),
              Text(
                'Mum Health',
                style: GoogleFonts.irishGrover(fontSize: 30, color: white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
