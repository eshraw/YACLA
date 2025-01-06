import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'rack_controller.dart';
import '/common/widgets/async_value_widget.dart';
import '../domain/shoes_model.dart';
import '../domain/harnesses_model.dart';
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
                _showAddShoeDialog(context, ref);
              },
            ),
            ListTile(
              title: const Text('Add Harness'),
              onTap: () {
                Navigator.pop(context);
                _showAddHarnessDialog(context, ref);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddShoeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Shoe'),
        content: StatefulBuilder(
          builder: (context, setState) {
            String brand = '';
            String model = '';
            String size = '';

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Brand'),
                  onChanged: (value) => brand = value,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Model'), 
                  onChanged: (value) => model = value,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Size'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) {
                    size = value.replaceAll(',', '.');
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (brand.isEmpty || model.isEmpty || size.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    final sizeDouble = double.tryParse(size);
                    if (sizeDouble == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a valid size')),
                      );
                      return;
                    }

                    final shoe = Shoe(
                      id: 0,
                      brand: brand,
                      model: model,
                      size: sizeDouble,
                    );

                    ref.read(rackControllerProvider.notifier).addShoe(shoe);
                    Navigator.pop(context);
                  },
                  child: const Text('Add Shoe'),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showAddHarnessDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Harness'),
        content: StatefulBuilder(
          builder: (context, setState) {
            String brand = '';
            String model = '';

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Brand'),
                  onChanged: (value) => brand = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Model'), 
                  onChanged: (value) => model = value,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (brand.isEmpty || model.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    final harness = Harness(
                      id: 0,
                      brand: brand,
                      model: model,
                    );

                    ref.read(rackControllerProvider.notifier).addHarness(harness);
                    Navigator.pop(context);
                  },
                  child: const Text('Add Harness'),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
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
              ShoeList(
                shoes: state.shoes,
                onDelete: (id) => ref.read(rackControllerProvider.notifier).deleteShoe(id),
              ),
              _buildSectionTitle(context, 'Harnesses'),
              HarnessList(
                harnesses: state.harnesses,
                onDelete: (id) => ref.read(rackControllerProvider.notifier).deleteHarness(id),
              ),
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