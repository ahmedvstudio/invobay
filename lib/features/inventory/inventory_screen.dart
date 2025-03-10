import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: const Center(child: Text('Inventory List Coming Soon!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Item screen (to be implemented)
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
