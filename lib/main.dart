import 'package:flutter/material.dart';
import 'package:iba_fall_2022/assignment_one.dart';
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
      home: MyHomePage(
        title: 'Hello',
      ),
    );
  }
}

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
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

  TextEditingController controller = TextEditingController();

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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Counter'),
            ),
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () {
                //
                print(controller.text);
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                //
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Hello'),
                      content: Text('GOogle'),
                      actions: [
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: Text('No'),
                          onPressed: () {},
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Alert dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('Waleed'),
                        ),
                        ListTile(
                          title: Text('Waleed'),
                        ),
                        ListTile(
                          title: Text('Waleed'),
                        ),
                        ListTile(
                          title: Text('Waleed'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Bottom sheet'),
            ),
            MyWidget(
              onTap: () {},
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
                onCounterUpdated: (counter) {
                  print(counter.toString());
                  _counter = counter;
                  setState(() {});
                },
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

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text('Waleed'),
          Text('Waleed@gmail.com'),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
