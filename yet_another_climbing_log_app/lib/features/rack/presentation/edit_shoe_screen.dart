import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/shoes_model.dart';
import 'rack_controller.dart';

class EditShoeScreen extends ConsumerWidget {
  final Shoe shoe;

  const EditShoeScreen({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final brandController = TextEditingController(text: shoe.brand);
    final modelController = TextEditingController(text: shoe.model);
    final sizeController = TextEditingController(text: shoe.size.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Shoe'),
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
            TextFormField(
              controller: sizeController,
              decoration: const InputDecoration(
                labelText: 'Size',
                hintText: 'e.g. 42.5 or 42,5',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                final normalizedSize = value.replaceAll(',', '.');
                if (double.tryParse(normalizedSize) == null) {
                  return 'Please enter a valid size';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final normalizedSize = sizeController.text.replaceAll(',', '.');
                  final updatedShoe = shoe.copyWith(
                    brand: brandController.text,
                    model: modelController.text,
                    size: double.tryParse(normalizedSize) ?? shoe.size,
                  );
                  
                  ref.read(rackControllerProvider.notifier)
                     .updateShoe(updatedShoe);
                  
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