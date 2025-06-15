import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/sheet/settings/encryption_key_sheet.dart';
import '../../../../core/providers/encryption_key_providers/encryption_key_provider.dart';
import '../../../../core/utils/helpers/backup_restore_helper.dart';

class BackupRestoreScreen extends ConsumerWidget {
  const BackupRestoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encryptionKey = ref.watch(encryptionKeyProvider);
    return Scaffold(
      appBar: VAppBar(
        title: const Text('Backup / Restore'),
        showBackArrow: true,
        actions: [
          IconButton(
            onPressed: () =>
                showEncryptionKeySheet(context, ref, encryptionKey),
            icon: const Icon(Iconsax.key),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: VSpacingStyle.all,
        child: Column(
          children: [
            const VSectionHeading(
                title: 'Drive Storage', buttonTitle: 'Unlock'),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            VSettingsMenuTile(
              icon: Iconsax.document_cloud,
              title: context.loc.syncData,
              subTitle: context.loc.syncDataToTheCloud,
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            const VSectionHeading(
                title: 'Local Storage', showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            VSettingsMenuTile(
              icon: Iconsax.document_download,
              title: context.loc.backupData,
              subTitle: context.loc.backupDataToYourLocalStorage,
              onTap: () async =>
                  await BackupRestoreHelper.backup(context, encryptionKey),
            ),
            VSettingsMenuTile(
              icon: Iconsax.document_upload,
              title: context.loc.loadData,
              subTitle: context.loc.loadDataFromYourLocalStorage,
              onTap: () async =>
                  await BackupRestoreHelper.restore(context, encryptionKey),
            ),
            VSettingsMenuTile(
              icon: Iconsax.document_text,
              title: context.loc.deleteData,
              subTitle: context.loc.deleteDataFromYourLocalStorage,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            const Text(
              "After restore, restart the app for data to reload.",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Restart.restartApp();
                },
                child: const Text('restart')),
          ],
        ),
      ),
    );
  }
}
