class UserJson {
  final String name;
  final String lastName;

  UserJson({
    required this.name,
    required this.lastName,
  });

  static UserJson fromJson(Map<String, dynamic> json) => UserJson(
        name: json['name'],
        lastName: json['lastName'],
      );
}
