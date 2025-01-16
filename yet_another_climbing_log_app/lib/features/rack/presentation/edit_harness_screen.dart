import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/harnesses_model.dart';
import 'rack_controller.dart';

class EditHarnessScreen extends ConsumerWidget {
  final Harness harness;

  const EditHarnessScreen({
    super.key,
    required this.harness,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final brandController = TextEditingController(text: harness.brand);
    final modelController = TextEditingController(text: harness.model);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Harness'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: brandController,
              decoration: const InputDecoration(labelText: 'Brand'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a brand' : null,
            ),
            TextFormField(
              controller: modelController,
              decoration: const InputDecoration(labelText: 'Model'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a model' : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final updatedHarness = harness.copyWith(
                    brand: brandController.text,
                    model: modelController.text,
                  );
                  
                  ref.read(rackControllerProvider.notifier)
                     .updateHarness(updatedHarness);
                  
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
} 