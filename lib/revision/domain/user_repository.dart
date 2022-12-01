import 'package:iba_fall_2022/revision/domain/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}