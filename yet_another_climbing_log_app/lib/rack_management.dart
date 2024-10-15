import 'package:flutter/material.dart';
import 'database_helper.dart';

class RackManagement extends StatefulWidget {
  const RackManagement({super.key});

  @override
  RackManagementState createState() => RackManagementState();
}

class RackManagementState extends State<RackManagement> {
  List<Map<String, dynamic>> _shoes = [];
  List<Map<String, dynamic>> _harnesses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshRackItems();
  }

  Future<void> _refreshRackItems() async {
    setState(() => _isLoading = true);
    _shoes = await DatabaseHelper.instance.getAllShoes();
    _harnesses = await DatabaseHelper.instance.getAllHarnesses();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Rack Management'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildSectionTitle('Shoes'),
                  _buildShoesList(),
                  _buildSectionTitle('Harnesses'),
                  _buildHarnessesList(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildShoesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _shoes.length,
      itemBuilder: (context, index) {
        final shoe = _shoes[index];
        return ListTile(
          title: Text('${shoe['shoes_brand']} ${shoe['shoes_model']}'),
          subtitle: Text('Size: ${shoe['shoes_size']}'),
          onTap: () => _showEditShoeDialog(shoe),
        );
      },
    );
  }

  void _showEditShoeDialog(Map<String, dynamic> shoe) {
    String brand = shoe['shoes_brand'];
    String model = shoe['shoes_model'];
    String size = shoe['shoes_size'].toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit my shoes'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Brand'),
                onChanged: (value) => brand = value,
                controller: TextEditingController(text: brand),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Model'),
                onChanged: (value) => model = value,
                controller: TextEditingController(text: model),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Size'),
                onChanged: (value) => size = value,
                controller: TextEditingController(text: size),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                await DatabaseHelper.instance.updateShoes(
                  shoe['shoes_id'],
                  {
                    'shoes_brand': brand,
                    'shoes_model': model,
                    'shoes_size': double.parse(size),
                  },
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                if (mounted) {
                    await _refreshRackItems();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildHarnessesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _harnesses.length,
      itemBuilder: (context, index) {
        final harness = _harnesses[index];
        return ListTile(
          title: Text('${harness['harness_brand']} ${harness['harness_model']}'),
          onTap: () => _showEditHarnessDialog(harness),
        );
      },
    );
  }

  void _showEditHarnessDialog(Map<String, dynamic> harness) {
    String brand = harness['harness_brand'];
    String model = harness['harness_model'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit my harness'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Brand'),
                onChanged: (value) => brand = value,
                controller: TextEditingController(text: brand),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Model'),
                onChanged: (value) => model = value,
                controller: TextEditingController(text: model),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                await DatabaseHelper.instance.updateHarness(
                  harness['harness_id'],
                  {
                    'harness_brand': brand,
                    'harness_model': model,
                  },
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
                if (mounted) {
                    await _refreshRackItems();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showAddShoeDialog();
                },
                child: const Text('Add Shoes'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showAddHarnessDialog();
                },
                child: const Text('Add Harness'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddShoeDialog() {
    String brand = '';
    String model = '';
    String size = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Shoes'),
          content: Column(
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
                keyboardType: TextInputType.number,
                onChanged: (value) => size = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (brand.isNotEmpty && model.isNotEmpty && size.isNotEmpty) {
                  double? sizeDouble = double.tryParse(size);
                  if (sizeDouble != null) {
                    await DatabaseHelper.instance.insertShoes({
                      'shoes_brand': brand,
                      'shoes_model': model,
                      'shoes_size': sizeDouble,
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                    if (mounted) {
                      await _refreshRackItems();
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a valid size')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddHarnessDialog() {
    String brand = '';
    String model = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Harness'),
          content: Column(
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (brand.isNotEmpty && model.isNotEmpty) {
                  // Use the singleton instance of DatabaseHelper
                  await DatabaseHelper.instance.insertHarness({
                    'harness_brand': brand,
                    'harness_model': model,
                  });
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  if (mounted) {
                    await _refreshRackItems();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
