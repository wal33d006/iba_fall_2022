import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({
    Key? key,
    required this.counter,
    required this.onCounterUpdated,
  }) : super(key: key);

  final int counter;
  final Function(int) onCounterUpdated;

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _counter.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
                widget.onCounterUpdated(_counter);
              },
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_counter);
              },
              child: Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
}
