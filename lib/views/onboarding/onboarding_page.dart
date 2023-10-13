import 'package:flutter/material.dart';
import 'package:ubenwa_thankgod/assets/assets.gen.dart';
import 'package:ubenwa_thankgod/core/utils/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  //  late AnimationController _controller;
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 4.0);
  }

  //   @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
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
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 57,
                        width: 57,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: yellow200),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 57,
                        width: 57,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: lavendarBlue100),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 57,
                        width: 57,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: lavendarBlue100),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 57,
                        width: 57,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: yellow200),
                      ),
                    ),
                    //   Align(
                    //   alignment: Alignment.center,
                    //   child: UbenwaAssets.images.svg.ellipse.svg()
                    // ),
                  ],
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
                  child: UbenwaAssets.images.svg.ellipse.svg(),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                      onTap: () {
                        _changeRotation();
                      },
                      child: UbenwaAssets.images.png.sleepingBaby.image()),
                ),
              ],
            ),
          )

          // PageView(children: [

          // ],)
        ],
      ),
    );
  }
}
