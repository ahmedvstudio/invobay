import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class VBillingPaymentSection extends ConsumerWidget {
  const VBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final selectedPayment = ref.watch(selectedPaymentProvider);
    final paymentMethods = ref.watch(paymentMethodsProvider);

    void showPaymentOptions() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: VSpacingStyle.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.loc.selectPaymentMethod,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const Divider(),
                  for (var method in paymentMethods)
                    ListTile(
                      tileColor: Colors.transparent,
                      leading: SvgPicture.asset(method.imagePath, width: 30),
                      title: Text(VHelperFunctions.getPaymentMethodLabel(
                          context, method.name)),
                      onTap: () {
                        ref
                            .read(selectedPaymentProvider.notifier)
                            .selectPayment(method);
                        context.pop();
                      },
                    ),
                  const SizedBox(height: VSizes.defaultSpace),
                ],
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        VSectionHeading(
          title: context.loc.paymentMethod,
          buttonTitle: context.loc.change,
          onPressed: showPaymentOptions,
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            VRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? VColors.darkerGrey : VColors.grey,
              padding: const EdgeInsets.all(VSizes.xs),
              child: SvgPicture.asset(selectedPayment.imagePath,
                  fit: BoxFit.contain),
            ),
            const SizedBox(width: VSizes.spaceBtwItems / 2),
            Text(
              VHelperFunctions.getPaymentMethodLabel(
                  context, selectedPayment.name),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
