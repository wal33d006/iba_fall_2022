import 'package:flutter/material.dart';

class AssignmentOne extends StatefulWidget {
  AssignmentOne({Key? key}) : super(key: key);

  @override
  State<AssignmentOne> createState() => _AssignmentOneState();
}

class _AssignmentOneState extends State<AssignmentOne> {
  final List<User> users = [
    User(
      name: 'Google',
      email: 'gmaild@gmail.com',
      isActive: true,
      imageUrl: 'https://farm3.staticflickr.com/2936/14765026726_b8a02d3989.jpg',
      views: 2000,
    ),
    User(
      name: 'Facebook',
      email: 'facebook@gmail.com',
      isActive: false,
      imageUrl: 'https://assets.thehansindia.com/h-upload/feeds/2019/04/19/166102-bliss.jpg',
      views: 150,
    ),
    User(
      name: 'Apple',
      email: 'apple@gmail.com',
      isActive: true,
      imageUrl: 'https://cdn.pixabay.com/photo/2013/08/09/05/54/layer-170971__480.jpg',
      views: 300,
    ),
    User(
      name: 'Meta',
      email: 'meta@gmail.com',
      isActive: false,
      imageUrl: 'https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png',
      views: 200,
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: ListView(
                    children: users
                        .map(
                          (user) => Hello(
                            title: user.name,
                            subtitle: user.email,
                            isActive: user.isActive,
                            onTap: () {
                              user.isActive = !user.isActive;
                              setState(() {});
                            },
                          ),
                        )
                        .toList()
                    //       ClipRRect(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(20),
                    //       topRight: Radius.circular(20),
                    //     ),
                    //     child: Card(
                    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    //       elevation: 4,
                    //       child: Column(
                    //         children: [
                    //           Image.network(user.imageUrl),
                    //           ListTile(
                    //             leading: CircleAvatar(
                    //               child: Text(user.name[0]),
                    //             ),
                    //             title: Text(user.name),
                    //             trailing: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 Icon(Icons.favorite),
                    //                 SizedBox(
                    //                   width: 80,
                    //                   child: Row(
                    //                     mainAxisAlignment: MainAxisAlignment.end,
                    //                     children: [
                    //                       Icon(Icons.visibility),
                    //                       Text(user.views.toString()),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             subtitle: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(user.email),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                    // .toList(),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hello extends StatefulWidget {
  const Hello({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isActive;
  final VoidCallback onTap;

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: InkWell(
        onTap: widget.onTap,
        child: Icon(
          Icons.favorite,
          color: widget.isActive ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String imageUrl;
  final int views;
  bool isActive;

  User({
    required this.name,
    required this.email,
    required this.isActive,
    required this.imageUrl,
    required this.views,
  });
}
