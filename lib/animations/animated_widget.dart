import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({
    Key? key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: const FlutterLogo(),
    );
  }
}

class MyAnimatedPage extends StatefulWidget {
  const MyAnimatedPage({Key? key}) : super(key: key);

  @override
  State<MyAnimatedPage> createState() => _MyAnimatedPageState();
}

class _MyAnimatedPageState extends State<MyAnimatedPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    // animation = Tween<double>(begin: 0, end: 200).animate(controller);
    final alpha = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween<double>(begin: 0, end: 200).animate(alpha);
    animation.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
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
                controller.forward();
              },
              child: Text('Forward'),
            ),
            AnimatedLogo(animation: animation),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.reverse();
        },
      ),
    );
  }
}
