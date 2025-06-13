import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/core/utils/messages/toast.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../styles/spacing_style.dart';

Future<void> showCurrencySignBottomSheet(
    BuildContext context, WidgetRef ref) async {
  final isDark = VHelperFunctions.isDarkMode(context);
  final currentSymbol = ref.read(currencySignProvider);
  final allCurrencies = CurrencyService().getAll();
  final searchController = TextEditingController();
  final filtered = ValueNotifier<List<Currency>>(allCurrencies);

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return Padding(
        padding: VSpacingStyle.responseKeyboard(context),
        child: SizedBox(
          height: VDeviceUtils.getScreenHeight(context) * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSectionHeading(
                  title: 'Select Currency', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  final query = value.toLowerCase();
                  filtered.value = allCurrencies.where((currency) {
                    return currency.name.toLowerCase().contains(query) ||
                        currency.code.toLowerCase().contains(query) ||
                        currency.symbol.toLowerCase().contains(query);
                  }).toList();
                },
                decoration: InputDecoration(
                  hintText: 'Search currency...',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
                  ),
                  prefixIcon: const Icon(Iconsax.search_normal,
                      color: VColors.darkGrey),
                  filled: true,
                  fillColor: isDark ? VColors.dark : VColors.light,
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Expanded(
                child: ValueListenableBuilder<List<Currency>>(
                  valueListenable: filtered,
                  builder: (context, currencies, _) {
                    if (currencies.isEmpty) {
                      return Center(
                        child: Text(
                          'No currencies found.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: currencies.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (ctx, index) {
                        final currency = currencies[index];

                        return ListTile(
                          leading: Text(
                            VHelperFunctions.currencyEmoji(currency),
                            style: const TextStyle(fontSize: VSizes.iconMd),
                          ),
                          title: Text(currency.name),
                          subtitle: Text(currency.code),
                          trailing: Text(currency.symbol),
                          onTap: () async {
                            final old = ref.read(appSettingsProvider).value;
                            if (old != null &&
                                currency.symbol != currentSymbol) {
                              final updated =
                                  old.copyWith(currencySign: currency.symbol);
                              await ref
                                  .read(appSettingsProvider.notifier)
                                  .updateSettings(updated);
                              VToast.info(
                                message:
                                    'Currency updated to ${currency.name} (${currency.symbol})',
                              );
                              if (context.mounted) {
                                context.pop();
                              }
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
