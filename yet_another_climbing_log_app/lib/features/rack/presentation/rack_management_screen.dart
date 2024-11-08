import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/rack_controller.dart';
import '/common/widgets/async_value_widget.dart';
import 'shoe_list.dart';
import 'harness_list.dart';

class RackManagementScreen extends ConsumerWidget {
  const RackManagementScreen({super.key});

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Add Shoes'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement shoe addition navigation
              },
            ),
            ListTile(
              title: const Text('Add Harness'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement harness addition navigation
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rackStateAsync = ref.watch(rackControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rack Management'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: AsyncValueWidget(
        value: rackStateAsync,
        data: (state) => SingleChildScrollView(
          child: Column(
            children: [
              _buildSectionTitle(context, 'Shoes'),
              ShoeList(shoes: state.shoes),
              _buildSectionTitle(context, 'Harnesses'),
              HarnessList(harnesses: state.harnesses),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}