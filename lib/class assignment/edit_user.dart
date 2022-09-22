import 'package:flutter/material.dart';
import 'package:iba_fall_2022/main.dart';

class EditUser extends StatefulWidget {
  EditUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = widget.user.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(
            User(
              name: controller.text,
              email: 'email',
              isFav: false,
              views: 123,
            ),
          );
        },
      ),
    );
  }
}
