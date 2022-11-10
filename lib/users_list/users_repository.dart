import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iba_fall_2022/users_list/user_json.dart';

class UsersRepository {
  final db = FirebaseFirestore.instance;

  Future<List<UserJson>> getUserList() async {
    List<UserJson> users = [];
    await db.collection("users").get().then((event) {
      users = event.docs.map((e) => UserJson.fromJson(e.data(), e.id)).toList();
    });

    return users;
  }
}
