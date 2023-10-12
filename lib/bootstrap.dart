import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';

class UbenwaBootstrap {
  const UbenwaBootstrap ();

  // @override
  // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //   super.onChange(bloc, change);
  //   log('onChange(${bloc.runtimeType}, $change)');
  // }

  // @override
  // void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
  //   log('onError(${bloc.runtimeType}, $error, $stackTrace)');
  //   super.onError(bloc, error, stackTrace);
  // }

  static Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };


  // Add cross-flavor configuration here

  runApp(await builder());
}
}


