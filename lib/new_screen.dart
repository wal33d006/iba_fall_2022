import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(widget.counter.toString()),
        ),
      ),
    );
  }
}
