import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'database_helper.dart';

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
  int _counter = 0;
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _addItem();
  }

  Future<void> _addItem() async {
    await DatabaseHelper.instance.insertItem({
      'name': 'Item $_counter',
      'quantity': _counter,
    });
    _refreshItems();
  }

  void _refreshItems() async {
    final data = await DatabaseHelper.instance.queryAllItems();
    setState(() {
      _items = data;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]['name']),
                    subtitle: Text('Quantity: ${_items[index]['quantity']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
