import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/general_announcement.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class GeneralAnnouncementsApiService extends NyApiService {
  GeneralAnnouncementsApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> findAll() async {
    return await network<List<GeneralAnnouncement>>(
      request: (request) => request.get("/general_announcements"),
      handleFailure: (error) {
        return [];
      },
    );
  }

  Future<dynamic> find() async {
    return await network<GeneralAnnouncement>(
      request: (request) => request.get("/general_announcements/1"),
      handleFailure: (error) {
        return null;
      },
    );
  }
}
