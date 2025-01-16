import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/common/widgets/async_value_widget.dart';
import 'climbed_routes_list.dart';
import 'climbing_log_controller.dart';
import 'add_climbed_route_screen.dart';

class ClimbingLogScreen extends ConsumerWidget {
  const ClimbingLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Climbing Log'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final climbedRoutesAsync = ref.watch(climbingLogControllerProvider);

          return AsyncValueWidget(
            value: climbedRoutesAsync,
            data: (climbedRoutes) => ClimbedRoutesList(
              climbedRoutes: climbedRoutes,
              onDelete: (id) {
                ref.read(climbingLogControllerProvider.notifier)
                   .deleteClimbedRoute(id);
              },
            ),
          );
        },
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
