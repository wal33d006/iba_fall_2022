import 'package:flutter/material.dart';

class AssignmentOne extends StatelessWidget {
  AssignmentOne({Key? key}) : super(key: key);


  List<User> users = [
    User(
      name: 'Google',
      email: 'gmaild@gmail.com',
      isActive: true,
    ),
    User(
      name: 'Facebook',
      email: 'facebook@gmail.com',
      isActive: false,
    ),
    User(
      name: 'Apple',
      email: 'apple@gmail.com',
      isActive: true,
    ),
    User(
      name: 'Meta',
      email: 'meta@gmail.com',
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: users
                      .map(
                        (user) =>
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: user.isActive ? Colors.green : Colors.red,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(user.name[0]),
                            ),
                            title: Text(user.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.email),
                              ],
                            ),
                          ),
                        ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final bool isActive;

  User({
    required this.name,
    required this.email,
    required this.isActive,
  });
}