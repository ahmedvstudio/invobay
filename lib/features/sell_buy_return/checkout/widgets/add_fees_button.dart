import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/dialogs/edit_fees_dialog.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/utils/constants/colors.dart';

class VAddFeesButton extends ConsumerWidget {
  const VAddFeesButton({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    return GestureDetector(
      onTap: () => showEditFeeDialog(context, ref, shippingFee, taxFee),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Add Fees',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: VColors.info),
        ),
      ),
    );
  }
}
