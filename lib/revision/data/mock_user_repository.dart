import 'package:iba_fall_2022/revision/domain/user_entity.dart';
import 'package:iba_fall_2022/revision/domain/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<List<UserEntity>> getUsers() async {
    return [
      UserEntity(name: 'waleed'),
      UserEntity(name: 'google'),
      UserEntity(name: 'facebook'),
      UserEntity(name: 'hello'),
      UserEntity(name: 'ashar'),
    ];
  }
}
