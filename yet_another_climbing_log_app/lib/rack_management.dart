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
        );
      },
    );
  }
}
