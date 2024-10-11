import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'database_helper.dart';
import 'climbing_log.dart';
import 'rack_management.dart';

void main() {
  runApp(const YetAnotherClimbingLogApp());
}

class YetAnotherClimbingLogApp extends StatelessWidget {
  const YetAnotherClimbingLogApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yet Another Climbing Log App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClimbingLog()),
                );
              },
              child: const Text('Check my log'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RackManagement()),
                );
              },
              child: const Text('Manage my rack'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      //),
    );
  }
}
