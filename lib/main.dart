import 'package:flutter/material.dart';
import 'package:iba_fall_2022/new_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Color iconColor = Colors.grey;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  User user = User(
    name: 'Waleed',
    email: 'waleed@gmail.com',
  );

  List<User> users = [
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
    ),
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
    ),
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Favorite'),
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    iconColor = Colors.red;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: iconColor,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: users
                    .map(
                      (user) => ListTile(
                        title: Text(user.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.email),
                            Text('Hello'),
                            Text('Hello'),
                            Text('Hello'),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewScreen(
                counter: _counter,
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
