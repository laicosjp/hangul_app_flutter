import 'package:nylo_framework/nylo_framework.dart';

/// GeneralAnnouncement Model.

class GeneralAnnouncement extends Model {
  final String title;
  final String body;

  GeneralAnnouncement({
    required this.title,
    required this.body,
  });

  factory GeneralAnnouncement.fromJson(dynamic data) {
    return GeneralAnnouncement(
      title: data['title'],
      body: data['body'],
    );
  }

  @override
  toJson() {
    return {};
  }
}
