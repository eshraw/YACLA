import 'package:flutter/material.dart';
import '../domain/shoes_model.dart';
import 'edit_shoe_screen.dart';

class ShoeList extends StatelessWidget {
  final List<Shoe> shoes;

  const ShoeList({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        final shoe = shoes[index];
        return ListTile(
          title: Text(shoe.model),
          subtitle: Text('Size: ${shoe.size}'),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditShoeScreen(shoe: shoe),
                ),
              );
            },
          ),
        );
      },
    );
  }
} 