import 'package:flutter/cupertino.dart';
import 'package:iba_fall_2022/users_list/user_json.dart';
import 'package:iba_fall_2022/users_list/users_repository.dart';

class UsersProvider with ChangeNotifier {
  List<UserJson> users = [];

  bool isLoading = false;

  final UsersRepository _usersRepository = UsersRepository();

  void fetchUsers() async {
    isLoading = true;
    notifyListeners();
    users = await _usersRepository.getUserList();
    isLoading = false;
    notifyListeners();
  }
}
