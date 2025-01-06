import 'package:flutter/material.dart';
import '../domain/harnesses_model.dart';
import 'edit_harness_screen.dart';

class HarnessList extends StatelessWidget {
  final List<Harness> harnesses;
  final Function(int)? onDelete;

  const HarnessList({
    super.key, 
    required this.harnesses,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: harnesses.length,
      itemBuilder: (context, index) {
        final harness = harnesses[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text('${harness.brand} ${harness.model}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditHarnessScreen(harness: harness),
                ),
              );
            },
            trailing: onDelete != null ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete!(harness.id),
            ) : null,
          ),
        );
      },
    );
  }
} 