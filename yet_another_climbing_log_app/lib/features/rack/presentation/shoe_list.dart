import 'package:flutter/material.dart';
import '../domain/shoes_model.dart';
import 'edit_shoe_screen.dart';

class ShoeList extends StatelessWidget {
  final List<Shoe> shoes;
  final Function(int)? onDelete;

  const ShoeList({
    super.key, 
    required this.shoes,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        final shoe = shoes[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text('${shoe.brand} ${shoe.model}'),
            subtitle: Text('Size: ${shoe.size}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditShoeScreen(shoe: shoe),
                ),
              );
            },
            trailing: onDelete != null ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => onDelete!(shoe.id),
            ) : null,
          ),
        );
      },
    );
  }
} 