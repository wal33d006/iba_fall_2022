import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 200).animate(controller);
    animation.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed) {
        controller.reverse();
      }
      if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    animation.addListener(() {
      print(animation.value);
      setState(() {});
    });
    // controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // controller.forward();
                },
                child: Text('Forward')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: animation.value,
              width: animation.value,
              child: const FlutterLogo(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.reverse();
        },
      ),
    );
  }
}
