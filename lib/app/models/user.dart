import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  late String email;

  User({required this.email});

  factory User.fromJson(dynamic data) {
    return User(email: data['email'] ?? "");
  }

  @override
  toJson() => {"email": email};
}
