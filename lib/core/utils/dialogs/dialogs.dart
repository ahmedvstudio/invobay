import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../common/styles/spacing_style.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class VDialogs {
  VDialogs._();

  /// --> OK
  static Future<void> ok(BuildContext context, String title, String message) {
    final isDark = VHelperFunctions.isDarkMode(context);
    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? VColors.dark : VColors.light,
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(child: Text(message)),
        ),
        scrollable: true,
        insetPadding: VSpacingStyle.symmetric,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(VSizes.borderRadiusXl),
        ),
        actions: [
          const SizedBox(height: VSizes.defaultSpace / 2),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.pop(ctx),
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }

  /// --> Yes No
  static Future<bool> confirm(
      BuildContext context, String title, String message) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  ///
  static Future<int?> action(
    BuildContext context,
    String title,
    String message,
    List<String> actionsLabels,
  ) async {
    return showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: List.generate(actionsLabels.length, (i) {
          return TextButton(
            onPressed: () => context.pop(actionsLabels[i]),
            child: Text(
              actionsLabels[i],
            ),
          );
        }),
      ),
    );
  }

  ///
  static Future<String?> input(
    BuildContext context,
    String title, {
    String hint = '',
    String initialValue = '',
    TextInputType keyboardType = TextInputType.text,
  }) async {
    final controller = TextEditingController(text: initialValue);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: true,
          decoration: InputDecoration(hintText: hint),
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancel')),
          TextButton(
              onPressed: () => context.pop(controller.text),
              child: const Text('OK')),
        ],
      ),
    );
  }

  ///
  static void showLoading(BuildContext context, {String? message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: VSizes.spaceBtwItems),
              Flexible(
                child: Text(message ?? 'Loading...'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  static void dismissLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).maybePop();
  }

  ///
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(VSizes.defaultSpace),
          ),
          insetPadding: const EdgeInsets.symmetric(
              horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info_outline, size: VSizes.iconXl),
                const SizedBox(height: VSizes.spaceBtwItems),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
