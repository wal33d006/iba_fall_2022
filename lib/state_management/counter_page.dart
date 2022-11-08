import 'package:flutter/material.dart';
import 'package:iba_fall_2022/state_management/counter_model.dart';
import 'package:iba_fall_2022/state_management/page_two.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            context.watch<Counter>().isLoading
                ? const CircularProgressIndicator()
                : Text(
                    context.watch<Counter>().count.toString(),
                    key: const Key('counterState'),
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageTwo(),
                  ),
                );
              },
              child: Text('Navigate'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_floatingActionButton'),

        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () {
          context.read<Counter>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _fetchCount() {
    context.read<Counter>().fetchCount();
  }
}
