import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<MyUser> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: users
            .map((e) => ListTile(
                  title: Text(e.name),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.parse('http://jsonplaceholder.typicode.com/users');
          final response = await http.get(url);
          // print(response.body);
          var list = jsonDecode(response.body) as List;
          // print(list.length);
          // print(list.first['name']);
          users = list.map((e) => MyUser.fromJson(e)).toList();
          setState(() {});

          print(users.length);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyUser {
  final String name;

  MyUser({required this.name});

  static MyUser fromJson(Map<String, dynamic> json) {
    return MyUser(name: json['name']);
  }
}
