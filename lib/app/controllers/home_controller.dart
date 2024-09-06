import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  onTapDocumentation() async {
    await launchUrl(Uri.parse("https://nylo.dev/docs"));
  }

  onTapGithub() async {
    await launchUrl(Uri.parse("https://github.com/nylo-core/nylo"));
  }

  onTapChangeLog() async {
    await launchUrl(Uri.parse("https://github.com/nylo-core/nylo/releases"));
  }

  onTapYouTube() async {
    await launchUrl(Uri.parse("https://m.youtube.com/@nylo_dev"));
  }

  onTapPolicy() async {
    await launchUrl(Uri.parse("https://hangul-app-astro.web.app/policy"));
  }

  showAbout() {
    showAboutDialog(
      context: context!,
      applicationName: getEnv('APP_NAME'),
      applicationIcon: const Logo(),
      applicationVersion: nyloVersion,
    );
  }

  onLogout() {
    Auth.remove();
    routeTo('/auth');
  }

  onStartCourse(int id) async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    // ハングル検定5級は初級なので無料にする
    if (id == 13) {
      routeTo('/course', queryParameters: {'id': id.toString()});
      return;
    }

    if (customerInfo.entitlements.all['monthly']?.isActive == true) {
      routeTo('/course', queryParameters: {'id': id.toString()});
    } else {
      routeTo('/purchase', queryParameters: {'id': id.toString()});
    }
  }
}
