import 'package:counter_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    var _counterProvider = context.read<CounterProvider>();
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _counterProvider.decrementCounter();
                },
                child: Text("-")),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _counterProvider.incrementCounter();
                },
                child: Text("+")),
          ],
        ),
      ),
    );
  }
}
