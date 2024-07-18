import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PolicyPage extends NyStatefulWidget {
  static const path = '/policy';

  PolicyPage({super.key}) : super(path, child: _PolicyPageState());
}

class _PolicyPageState extends NyState<PolicyPage> {
  final url = "https://hangul-app-astro.web.app/policy";

  @override
  Widget view(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: InAppWebView(
          initialSettings: InAppWebViewSettings(
            textZoom: 80,
          ),
          initialUrlRequest: URLRequest(url: WebUri(url)),
        ),
      ),
    );
  }
}
