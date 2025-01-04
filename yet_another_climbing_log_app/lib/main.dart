import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/climbing_log/presentation/climbing_log_screen.dart';
import 'features/rack/presentation/rack_management_screen.dart';
import 'features/climbing_log/presentation/add_climbed_route_screen.dart';

void main() {
  runApp(const ProviderScope(child: YetAnotherClimbingLogApp()));
}

class YetAnotherClimbingLogApp extends StatelessWidget {
  const YetAnotherClimbingLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yet Another Climbing Log App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Yet Another Climbing Log App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClimbingLogScreen()),
                );
              },
              child: const Text('Check my log'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RackManagementScreen()),
                );
              },
              child: const Text('Manage my rack'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddClimbedRouteScreen(),
            ),
          );
        },
        tooltip: 'Add Climbed Route',
        child: const Icon(Icons.add),
      ),
    );
  }
}
