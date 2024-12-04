import 'package:flutter/material.dart';
import '../domain/route_model.dart' as route_model;

class RoutesList extends StatelessWidget {
  final List<route_model.Route> routes;

  const RoutesList({
    super.key,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routes.length,
      itemBuilder: (context, index) {
        final route = routes[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(route.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Grade: ${route.grade}'),
                Text('Type: ${route.type}'),
                Text('Sector ID: ${route.sectorId}'), // TODO: Get actual sector name
              ],
            ),
          ),
        );
      },
    );
  }
}

