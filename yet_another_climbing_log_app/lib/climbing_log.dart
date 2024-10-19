import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'add_climbed_route.dart';

class ClimbingLog extends StatefulWidget {
  const ClimbingLog({super.key});

  @override
  ClimbingLogState createState() => ClimbingLogState();
}

class ClimbingLogState extends State<ClimbingLog> {
  final int _itemsPerPage = 20;
  int _currentPage = 0;
  final List<Map<String, dynamic>> _climbedRoutes = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final newItems = await DatabaseHelper.instance.getAllClimbedRoutes(
      limit: _itemsPerPage,
      offset: _currentPage * _itemsPerPage,
    );

    setState(() {
      _climbedRoutes.addAll(newItems);
      _currentPage++;
      _isLoading = false;
    });
  }

  Future<void> _editRoute(Map<String, dynamic> route) async {
    final editedRoute = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => AddClimbedRoute(routeToEdit: route),
      ),
    );

    if (editedRoute != null) {
      setState(() {
        final index = _climbedRoutes.indexWhere((r) => r['id'] == route['id']);
        if (index != -1) {
          _climbedRoutes[index] = editedRoute;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Climbing Log'),
      ),
      body: ListView.builder(
        itemCount: _climbedRoutes.length + 1,
        itemBuilder: (context, index) {
          if (index < _climbedRoutes.length) {
            final route = _climbedRoutes[index];
            return ListTile(
              title: Text(route['route_name'] ?? 'Unknown Route'),
              subtitle: Text('Grade: ${route['route_grade'] ?? 'Unknown'}'),
              trailing: Text(route['done_type'] ?? 'Unknown'),
              onTap: () => _editRoute(route),
            );
          } else if (_isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ElevatedButton(
              onPressed: _loadMoreItems,
              child: const Text('Load More'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddClimbedRoute()),
          );
        },
        tooltip: 'Add Climbed Route',
        child: const Icon(Icons.add),
      ),
    );
  }
}
