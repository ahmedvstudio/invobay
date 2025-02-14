import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InventoryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const InventoryButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: const Text(
          'Inventory',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        icon: const Icon(
          Iconsax.box,
          size: 50,
        ),
        style: const ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))))),
      ),
    );
  }
}
