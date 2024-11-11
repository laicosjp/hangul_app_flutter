import 'package:flutter/material.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class UsersApiService extends NyApiService {
  UsersApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  // This method is used to withdraw user, not to delete user.
  Future<dynamic> destroy() async {
    final authorization = await NyStorage.read("authorization");

    Auth.remove();

    return await network(
      request: (request) => request.delete("/users"),
      headers: {'Authorization': 'Bearer ${authorization}'},
    );
  }
}
