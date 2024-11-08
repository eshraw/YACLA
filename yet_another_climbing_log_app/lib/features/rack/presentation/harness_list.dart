import 'package:flutter/material.dart';
import '../domain/harnesses_model.dart';

class HarnessList extends StatelessWidget {
  final List<Harness> harnesses;

  const HarnessList({super.key, required this.harnesses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: harnesses.length,
      itemBuilder: (context, index) {
        final harness = harnesses[index];
        return ListTile(
          title: Text(harness.model),
        );
      },
    );
  }
} 