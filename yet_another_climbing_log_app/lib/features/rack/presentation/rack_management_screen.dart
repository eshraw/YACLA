class RackManagementScreen extends ConsumerWidget {
  const RackManagementScreen({super.key});

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