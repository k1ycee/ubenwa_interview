import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:ubenwa_thankgod/core/services/storage_service.dart';

class UbenwaBootstrap {
  const UbenwaBootstrap();

  static Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };

    await runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await StorageService.init();
      runApp(await builder());
    }, (error, stack) {
      log(error.toString());
    });
    // runApp(await runZonedGuarded(() => null, (error, stack) { }));
  }
}
