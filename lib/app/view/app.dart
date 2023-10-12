import 'package:flutter/material.dart';
import 'package:ubenwa_thankgod/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LogoRotate(),
    );
  }
}


class LogoRotate extends StatefulWidget {
  const LogoRotate({super.key});

  @override
  State<LogoRotate> createState() => LogoRotateState();
}

class LogoRotateState extends State<LogoRotate> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      
          children: <Widget>[
            ElevatedButton(
              onPressed: _changeRotation,
              child: const Text('Rotate Logo'),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(
                turns: turns,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class TurnAnimation extends StatefulWidget {
//   @override
//   _TurnAnimationState createState() => _TurnAnimationState();
// }

// class _TurnAnimationState extends State<TurnAnimation> {
//   double _rotationAngle = 0.0;

//   void _handleTap() {
//     setState(() {
//       _rotationAngle += 90.0;
//       if (_rotationAngle >= 360.0) {
//         _rotationAngle = 0.0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Center(
//         child: GestureDetector(
//           onTap: _handleTap,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.green,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.yellow,
//                 ),
//               ),
//               AnimatedPositioned(
//                 duration: Duration(milliseconds: 500),
//                 top: _rotationAngle == 0 ? 0 : null,
//                 right: _rotationAngle == 90 ? 0 : null,
//                 bottom: _rotationAngle == 180 ? 0 : null,
//                 left: _rotationAngle == 270 ? 0 : null,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.purple,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class TurnAnimation extends StatefulWidget {
//   @override
//   _TurnAnimationState createState() => _TurnAnimationState();
// }

// class _TurnAnimationState extends State<TurnAnimation> {
//   double _rotationAngle = 0.0;

//   void _handleTap() {
//     setState(() {
//       _rotationAngle += 90.0;
//       if (_rotationAngle >= 360.0) {
//         _rotationAngle = 0.0;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: _handleTap,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: 50,
//                 // left: 50,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 top: 100,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.green,
//                 ),
//               ),
//               Positioned(
//                 bottom: ,
//                 // left: 100,
//                 // right: 100,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 100,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.yellow,
//                 ),
//               ),
//               // AnimatedPositioned(
//               //   duration: Duration(milliseconds: 500),
//               //   curve: Curves.easeInOut,
//               //   top: _rotationAngle == 0 ? 50 : 0,
//               //   right: _rotationAngle == 90 ? 50 : 0,
//               //   bottom: _rotationAngle == 180 ? 50 : 0,
//               //   left: _rotationAngle == 270 ? 50 : 0,
//               //   child: Container(
//               //     width: 100,
//               //     height: 100,
//               //     color: Colors.purple,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class TurnAnimation extends StatefulWidget {
//   @override
//   _TurnAnimationState createState() => _TurnAnimationState();
// }

// class _TurnAnimationState extends State<TurnAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   double _rotationAngle = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           _rotationAngle += 90.0;
//           if (_rotationAngle >= 360.0) {
//             _rotationAngle = 0.0;
//           }
//         });
//         _controller.reset();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             if (_controller.status == AnimationStatus.dismissed) {
//               _controller.forward();
//             }
//           },
//           child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _rotationAngle * (3.14159265359 / 180),
//               child: Container(
//                 width: 100.0,
//                 height: 100.0,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Tap Me!',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }