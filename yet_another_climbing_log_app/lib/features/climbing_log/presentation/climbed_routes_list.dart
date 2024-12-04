import 'package:flutter/material.dart';
import '../domain/climbed_route_model.dart';

class ClimbedRoutesList extends StatelessWidget {
  final List<ClimbedRoute> climbedRoutes;
  final Function(int)? onDelete;

  const ClimbedRoutesList({
    super.key, 
    required this.climbedRoutes,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: climbedRoutes.length,
      itemBuilder: (context, index) {
        final route = climbedRoutes[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(route.routeName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Grade: ${route.routeGrade}'),
                Text('Type: ${route.routeType}'),
                Text('Try #${route.tryNumber}'),
                if (route.isDone) Text('Done: ${route.doneType}'),
              ],
            ),
            trailing: onDelete != null ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete!(route.id),
            ) : null,
          ),
        );
      },
    );
  }
}
