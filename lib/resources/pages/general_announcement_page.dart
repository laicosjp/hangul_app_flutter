import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/general_announcement.dart';
import 'package:flutter_app/app/networking/general_announcements_api_service.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';

class GeneralAnnouncementPage extends NyStatefulWidget {
  static const path = '/general-announcement';

  GeneralAnnouncementPage({super.key})
      : super(path, child: _GeneralAnnouncementPageState());
}

class _GeneralAnnouncementPageState extends NyState<GeneralAnnouncementPage> {
  final _api = GeneralAnnouncementsApiService();
  late GeneralAnnouncement? _generalAnnouncement;

  @override
  init() async {
    _generalAnnouncement = await _api.find(widget.data()['id']);
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _generalAnnouncement?.title ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Gap(20),
              Text(_generalAnnouncement?.body ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
