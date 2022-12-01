import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:iba_fall_2022/users_list/users_provider.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  String hello = '';
  String? google;

  Color? favColor;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<UsersProvider>().fetchUsers();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.subscribeToTopic('news');
  }

  @override
  Widget build(BuildContext context) {
    final users = context.watch<UsersProvider>().users;
    return Scaffold(
      body: context.watch<UsersProvider>().isUsersFetching
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name),
                );
              }),
    );
  }
}
