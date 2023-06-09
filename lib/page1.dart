import 'package:flutter/material.dart';

class Orientation1Page extends StatefulWidget {
  const Orientation1Page({super.key});

  @override
  State<Orientation1Page> createState() => _Orientation1PageState();
}

class _Orientation1PageState extends State<Orientation1Page> {
  void _tapAction() {
    setState(() {
      // action
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("device orientation test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'hoge',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tapAction,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
