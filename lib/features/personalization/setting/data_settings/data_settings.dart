import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/sheet/settings/encryption_key_sheet.dart';
import '../../../../core/providers/encryption_key_providers/encryption_key_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/backup_restore_helper.dart';

class VDataSettings extends ConsumerWidget {
  const VDataSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encryptionKey = ref.watch(encryptionKeyProvider);
    return Column(
      children: [
        VSectionHeading(
          title: context.loc.dataSettings,
          buttonTitle: context.loc.encryptionKey,
          onPressed: () => showEncryptionKeySheet(context, ref, encryptionKey),
        ),
        const SizedBox(height: VSizes.spaceBtwItems),
        VSettingsMenuTile(
          icon: Iconsax.document_upload,
          title: context.loc.backupData,
          subTitle: context.loc.backupDataToYourLocalStorage,
          onTap: () async => await BackupRestoreHelper.backupAll(
              encryptionKey: encryptionKey, context: context),
        ),
        VSettingsMenuTile(
          icon: Iconsax.document_download,
          title: context.loc.loadData,
          subTitle: context.loc.loadDataFromYourLocalStorage,
          onTap: () async => await BackupRestoreHelper.restoreAll(
              context: context, encryptionKey: encryptionKey),
        ),
        VSettingsMenuTile(
          icon: Iconsax.folder_cross,
          title: context.loc.deleteData,
          subTitle: context.loc.deleteDataFromYourLocalStorage,
          onTap: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => VDeleteConfirmDialog(
                isCustomer: false,
                isGeneral: true,
                contentText: context.loc.areYouSureYouWantToDeleteAllData,
              ),
            );
            if (confirm == true) {
              if (!context.mounted) return;
              await BackupRestoreHelper.deleteAllLocalData(context);
            }
          },
        ),
        Text(
          context.loc.mustRestartTheAppForChangesToTakeEffect,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: VColors.error),
        ),
      ],
    );
  }
}
