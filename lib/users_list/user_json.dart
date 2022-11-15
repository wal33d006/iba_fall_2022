import 'package:iba_fall_2022/assignment_one.dart';

class UserJson {
  final String name;
  final String id;
  final int followers;

  UserJson({
    required this.name,
    required this.id,
    this.followers = 0,
  });

  static UserJson fromJson(Map<String, dynamic> json, String id) => UserJson(
        name: json['first'] as String? ?? '',
        followers: json['followers'] as int? ?? -1,
        id: id,
      );
}

void hello () {
  UserJson(
    name: '',
    id: '',
    followers: 13,
  );
}


class Hello {
  String title;

  Hello({required this.title});
}