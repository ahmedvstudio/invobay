import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/providers/encryption_key_providers/encryption_key_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/toast.dart';
import '../../../styles/spacing_style.dart';

Future<void> showEncryptionKeySheet(
    BuildContext context, WidgetRef ref, String encryptionKey) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(VSizes.defaultSpace)),
    ),
    builder: (context) {
      final isDark = VHelperFunctions.isDarkMode(context);
      final keyController = TextEditingController(text: encryptionKey);

      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Encryption Key',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            TextFormField(
              maxLength: 32,
              controller: keyController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Encryption Key",
                prefixIcon: Icon(
                  Iconsax.key,
                  color: isDark
                      ? VColors.light.withAlpha(128)
                      : VColors.dark.withAlpha(128),
                ),
                hintText: "Must be 32 char.",
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final input = keyController.text.trim();

                      if (input.length != 32) {
                        VToast.error(message: "Key must be 32 char.");
                        return;
                      }

                      await ref
                          .read(encryptionKeyProvider.notifier)
                          .updateKey(input);
                      VToast.success(message: "Encryption key updated!");
                      if (!context.mounted) return;
                      context.pop();
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: VSizes.defaultSpace),
          ],
        ),
      );
    },
  );
}
