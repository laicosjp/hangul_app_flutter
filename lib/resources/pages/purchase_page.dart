import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'dart:io' show Platform;
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PurchasePage extends NyStatefulWidget {
  static const path = '/purchase';

  PurchasePage({super.key}) : super(path, child: () => _PurchasePageState());
}

class _PurchasePageState extends NyState<PurchasePage> {
  int? courseId;

  @override
  init() async {
    courseId = int.parse(queryParameters()['id'] ?? '0');

    initPlatformState();
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration configuration;
    if (Platform.isIOS) {
      configuration =
          PurchasesConfiguration('hangul_test_fourth_lifetime_access');
      await Purchases.configure(configuration);
    }
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Purchase")),
        body: SafeArea(
          child: PaywallView(onRestoreCompleted: (CustomerInfo customerInfo) {
            // Optional listener. Called when a restore has been completed.
            // This may be called even if no entitlements have been granted.
          }, onDismiss: () {
            // Dismiss the paywall, i.e. remove the view, navigate to another screen, etc.
            // Will be called when the close button is pressed (if enabled) or when a purchase succeeds.
          }),
        ));
  }
}
