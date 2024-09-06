import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'bootstrap/boot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  initPlatformState();

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.getInitialRoute(),
      navigatorObservers: nylo.getNavigatorObservers(),
    ),
  );
}

Future<void> initPlatformState() async {
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration configuration;
  if (Platform.isIOS) {
    configuration = PurchasesConfiguration(getEnv('REVENUECAT_API_KEY'));
    await Purchases.configure(configuration);
  }
  // ---TDOO: Android版のロジックを追加する
}
