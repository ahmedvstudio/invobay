import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

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
        return Consumer(builder: (context, ref, _) {
          final isVisible = ref.watch(isEncryptionKeyObscureProvider);
          final isVisibleNotifier =
              ref.read(isEncryptionKeyObscureProvider.notifier);
          final isDark = VHelperFunctions.isDarkMode(context);
          final keyController = TextEditingController(text: encryptionKey);

          return Padding(
            padding: VSpacingStyle.responseKeyboard(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.loc.changeEncryptionKey,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                TextFormField(
                  maxLength: 32,
                  controller: keyController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    labelText: context.loc.encryptionKey,
                    prefixIcon: Icon(
                      Iconsax.key,
                      color: isDark
                          ? VColors.light.withAlpha(128)
                          : VColors.dark.withAlpha(128),
                    ),
                    hintText: context.loc.mustBeCharacterLong,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isVisibleNotifier.state = !isVisibleNotifier.state;
                      },
                      icon: Icon(
                        isVisible ? Iconsax.eye_slash : Iconsax.eye,
                        color: isDark
                            ? VColors.light.withAlpha(100)
                            : VColors.dark.withAlpha(100),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.pop(),
                        child: Text(context.loc.cancel),
                      ),
                    ),
                    const SizedBox(width: VSizes.spaceBtwItems),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final input = keyController.text.trim();

                          if (input.length != 32) {
                            VToast.error(
                                message: context.loc.mustBeCharacterLong);
                            return;
                          }

                          await ref
                              .read(encryptionKeyProvider.notifier)
                              .updateKey(input);
                          if (!context.mounted) return;
                          VToast.success(
                              message: context.loc.encryptionKeyUpdated);
                          if (!context.mounted) return;
                          context.pop();
                        },
                        child: Text(context.loc.save),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: VSizes.defaultSpace),
              ],
            ),
          );
        });
      });
}
