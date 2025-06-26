import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
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
      child: Padding(
        padding: VSpacingStyle.withoutTop,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
                title: isCustomer
                    ? context.loc.customerAction
                    : context.loc.supplierAction,
                showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            ListTile(
              leading: const Icon(Iconsax.edit),
              title: Text(context.loc.edit),
              onTap: () {
                context.pop();
                onEdit();
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.trash),
              title: Text(context.loc.delete),
              onTap: () {
                context.pop();
                onDelete();
              },
            ),
            if (phone1 != null && phone1!.isNotEmpty)
              ListTile(
                leading: const Icon(Iconsax.call),
                title: Text('${context.loc.call} $phone1'),
                onTap: () {
                  context.pop();
                  VHelperFunctions.makePhoneCall(phone1);
                },
              ),
            if (phone2 != null && phone2!.isNotEmpty)
              ListTile(
                leading: const Icon(Iconsax.call5),
                title: Text('${context.loc.call} $phone2'),
                onTap: () {
                  context.pop();
                  VHelperFunctions.makePhoneCall(phone2);
                },
              ),
          ],
        ),
      ),
    );
  }
}
