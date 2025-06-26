import 'package:flutter/material.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

class VReceiptDetailFooterSection extends StatelessWidget {
  const VReceiptDetailFooterSection({
    super.key,
    required this.totalPrice,
    required this.paymentStatus,
    required this.paidAmount,
    required this.debtAmount,
  });

  final String totalPrice;
  final String paidAmount;
  final String debtAmount;
  final String paymentStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${context.loc.total}: $totalPrice",
                style: Theme.of(context).textTheme.titleMedium),
            Text("${context.loc.paidAmount}: $paidAmount",
                style: Theme.of(context).textTheme.titleLarge),
            if (debtAmount != '0.00')
              Text("${context.loc.debtAmount}: $debtAmount",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: VColors.error)),
            Text(
                "${context.loc.status}: ${VHelperFunctions.paymentStatusLabel(context, paymentStatus)}",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: (debtAmount != '0.00')
                        ? VColors.warning
                        : VColors.success)),
          ],
        ),
      ],
    );
  }
}
