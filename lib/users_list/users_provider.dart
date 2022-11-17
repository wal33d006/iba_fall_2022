import 'package:flutter/cupertino.dart';
import 'package:iba_fall_2022/users_list/user_json.dart';
import 'package:iba_fall_2022/users_list/users_repository.dart';

class UsersProvider with ChangeNotifier {
  UsersProvider(this._usersRepository);

  List<UserJson> users = [];

  final UsersRepository _usersRepository;

  bool isUsersFetching = false;

  void fetchUsers() async {
    isUsersFetching = true;
    notifyListeners();
    users = await _usersRepository.fetchUsersList();
    isUsersFetching = false;
    notifyListeners();
  }
}
