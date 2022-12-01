import 'package:flutter/foundation.dart';
import 'package:iba_fall_2022/revision/data/firebase_user_repository.dart';
import 'package:iba_fall_2022/revision/domain/user_entity.dart';
import 'package:iba_fall_2022/revision/domain/user_repository.dart';

class RevisionProvider with ChangeNotifier {
  RevisionProvider(this.userRepository);

  final UserRepository userRepository;

  List<UserEntity> users = [];

  Future<void> fetchUsers() async {
    users = await userRepository.getUsers();
    notifyListeners();
  }
}
