import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

class AddressActionSheet extends StatelessWidget {
  final BuildContext context;
  final bool isCustomer;
  final int id;
  final String? phone1;
  final String? phone2;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AddressActionSheet({
    super.key,
    required this.context,
    required this.isCustomer,
    required this.id,
    required this.phone1,
    required this.phone2,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Iconsax.edit),
            title: const Text('Edit'),
            onTap: () {
              context.pop();
              onEdit();
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.trash),
            title: const Text('Delete'),
            onTap: () {
              context.pop();
              onDelete();
            },
          ),
          if (phone1 != null && phone1!.isNotEmpty)
            ListTile(
              leading: const Icon(Iconsax.call),
              title: Text('Call $phone1'),
              onTap: () {
                context.pop();
                VHelperFunctions.makePhoneCall(phone1);
              },
            ),
          if (phone2 != null && phone2!.isNotEmpty)
            ListTile(
              leading: const Icon(Iconsax.call5),
              title: Text('Call $phone2'),
              onTap: () {
                context.pop();
                VHelperFunctions.makePhoneCall(phone2);
              },
            ),
        ],
      ),
    );
  }
}
