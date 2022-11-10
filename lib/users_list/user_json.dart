class UserJson {
  final String name;
  final String id;

  UserJson({
    required this.name,
    required this.id,
  });

  static UserJson fromJson(Map<String, dynamic> json, String id) => UserJson(
        name: json['first'],
        id: id,
      );
}
