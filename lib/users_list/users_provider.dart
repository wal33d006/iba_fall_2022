import 'package:flutter/cupertino.dart';
import 'package:iba_fall_2022/users_list/user_json.dart';
import 'package:iba_fall_2022/users_list/users_repository.dart';

class UsersProvider with ChangeNotifier {
  List<UserJson> users = [];

  bool isUsersFetching = false;

  final UsersRepository _usersRepository = FirebaseUsersRepository();

  void fetchUsers() async {
    isUsersFetching = true;
    notifyListeners();
    users = await _usersRepository.fetchUsersList();
    isUsersFetching = false;
    notifyListeners();
  }
}
