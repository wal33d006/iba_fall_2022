import 'package:flutter/material.dart';
import 'package:iba_fall_2022/class%20assignment/edit_user.dart';
import 'package:iba_fall_2022/main.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name),
            Text(user.email),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditUser(user: user),
            ),
          );
          Navigator.of(context).pop(result);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
