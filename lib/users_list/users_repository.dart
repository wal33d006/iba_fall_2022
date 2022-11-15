import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iba_fall_2022/users_list/user_json.dart';

abstract class UsersRepository {
  Future<List<UserJson>> getUserList();
}

class FirebaseUsersRepository implements UsersRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<UserJson>> getUserList() async {
    List<UserJson> users = [];
    await db.collection("users").get().then((event) {
      users = event.docs.map((e) => UserJson.fromJson(e.data(), e.id)).toList();
    });

    return users;
  }
}

class MockUsersRepository implements UsersRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<UserJson>> getUserList() async {
    List<UserJson> users = [
      UserJson(name: 'Hello', id: '1234'),
      UserJson(name: 'Google', id: '1234'),
      UserJson(name: 'Facebook', id: '1234'),
      UserJson(name: 'Apple', id: '1234'),
      UserJson(name: 'Microsoft', id: '1234'),
    ];
    return users;
  }
}
