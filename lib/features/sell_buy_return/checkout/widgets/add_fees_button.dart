import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../common/widgets/sheet/add_sheets/add_fees_sheet.dart';
import '../../../../core/utils/constants/colors.dart';

class VAddFeesButton extends ConsumerWidget {
  const VAddFeesButton({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => showEditFeeBottomSheet(context, ref),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          context.loc.addFees,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: VColors.info),
        ),
      ),
    );
  }
}
