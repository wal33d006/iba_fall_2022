import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iba_fall_2022/revision/domain/user_entity.dart';
import 'package:iba_fall_2022/revision/data/user_json.dart';
import 'package:iba_fall_2022/revision/domain/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<UserEntity>> getUsers() async {
    final userList = await db.collection("users").get();
    final list = userList.docs
        .map((e) => UserJson.fromJson(e as Map<String, dynamic>))
        .toList()
        .map((e) => UserEntity(name: '${e.name} ${e.lastName}'))
        .toList();

    return list;
  }
}
