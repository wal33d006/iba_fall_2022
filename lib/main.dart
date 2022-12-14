import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:iba_fall_2022/class%20assignment/screen_two.dart';
import 'package:iba_fall_2022/new_screen.dart';
import 'package:iba_fall_2022/revision/data/mock_user_repository.dart';
import 'package:iba_fall_2022/revision/domain/user_repository.dart';
import 'package:iba_fall_2022/revision/user_list/revision_page.dart';
import 'package:iba_fall_2022/state_management/counter_model.dart';
import 'package:iba_fall_2022/state_management/counter_page.dart';
import 'package:iba_fall_2022/users_list/users_list_page.dart';
import 'package:iba_fall_2022/users_list/users_provider.dart';
import 'package:iba_fall_2022/users_list/users_repository.dart';
import 'package:provider/provider.dart';

import 'revision/user_list/revision_provider.dart';

final getIt = GetIt.instance;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Convert your data point here
  getIt.registerSingleton<UsersRepository>(MockUsersRepository());
  getIt.registerSingleton<UserRepository>(MockUserRepository());

  runApp(MultiProvider(
    providers: [
      Provider<RevisionProvider>(
        create: (_) => RevisionProvider(
          getIt(),
        ),
      ),
    ],
    child: const MyApp(),
  ));
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
      home: const RevisionPage(),
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

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.data()['first']}");
      }
    });
  }

  // User user = User(
  //   name: 'Waleed',
  //   email: 'waleed@gmail.com',
  // );

  bool myFav = false;

  List<User> users = [
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
      isFav: false,
      views: 2000,
    ),
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
      isFav: false,
      views: 1500,
    ),
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
      isFav: false,
      views: 3000,
    ),
  ];

  final _user = User(
    views: 1000,
    isFav: false,
    name: 'Waleed',
    email: 'hello@gmail.com',
  );

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
              onPressed: () async {
                final user = <String, dynamic>{"first": "Ada", "last": "Lovelace", "born": 1815};

// Add a new document with a generated ID
                await db.collection("users").add(user);
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
            // MyCard(
            //   user: _user,
            //   onValueChanged: (value) {
            //     _user.isFav = value;
            //     setState(() {});
            //   },
            //   value: _user.isFav,
            // ),
            MyWidget(
              onTap: () {},
            ),
            HelloWidget(
              isFav: myFav,
              onTap: () {
                myFav = !myFav;
                setState(() {});
              },
            ),
            Expanded(
              child: ListView(
                children: users
                    .map(
                      (user) => MyCard(
                        user: user,
                        onTap: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenTwo(user: user),
                            ),
                          );
                          users.removeAt(users.indexOf(user));
                          users.add(result);
                          setState(() {});
                        },
                        onValueChanged: (bool value) {
                          user.isFav = value;
                          setState(() {});
                        },
                        value: user.isFav,
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

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
    required this.user,
    required this.onValueChanged,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final User user;
  final bool value;
  final Function(bool) onValueChanged;
  final VoidCallback onTap;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Text(widget.user.name),
      subtitle: Text(widget.user.email),
      trailing: InkWell(
        onTap: () {
          // widget.onValueChanged(!widget.value);
        },
        child: Icon(
          Icons.favorite,
          color: widget.value ? Colors.red : Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        child: Text(widget.user.name[0]),
      ),
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
  bool isFav;
  final int views;

  User({
    required this.name,
    required this.email,
    required this.isFav,
    required this.views,
  });
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    Key? key,
    required this.isFav,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.favorite,
        color: isFav ? Colors.red : Colors.grey,
      ),
    );
  }
}
