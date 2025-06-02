import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/features/vault/widgets/vault_buttons.dart';

import '../../common/styles/spacing_style.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/item_cards/summary_card.dart';
import '../../common/widgets/sheet/vault/edit_transaction_sheet.dart';
import '../../common/widgets/sheet/vault/vault_amount_sheet.dart';
import '../../common/widgets/sheet/vault/vault_transaction_sheet.dart';
import '../../core/providers/vault_providers/vault_related_providers.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';

class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});

  static const vaultId = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vaultState = ref.watch(vaultDetailNotifierProvider(vaultId));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VAppBar(
              showBackArrow: true,
              title: Text('Vault / Expense'),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            vaultState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
              data: (detail) {
                if (detail == null) {
                  return const Center(child: Text("Vault not found"));
                }

                return Padding(
                  padding: VSpacingStyle.withoutTop,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          VSummaryCard(
                            title: 'Vault Balance',
                            vaultAmount: detail.vault.amountOnHand,
                            amount: detail.currentBalance,
                            icon: Iconsax.money_recive,
                            color: VColors.info,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () => showVaultEditBottomSheet(
                                context,
                                ref,
                                vaultId,
                                detail.vault.amountOnHand,
                              ),
                              icon: const Icon(
                                Iconsax.edit,
                                size: VSizes.iconSd,
                                color: VColors.info,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: VSizes.spaceBtwItems),
                      Row(
                        children: [
                          Expanded(
                            child: VSummaryCard(
                              title: 'Total In',
                              amount: detail.totalAdded,
                              icon: Iconsax.money_recive,
                              color: VColors.success,
                            ),
                          ),
                          const SizedBox(width: VSizes.spaceBtwItems),
                          Expanded(
                            child: VSummaryCard(
                              title: 'Total Out',
                              amount: detail.totalReduced,
                              icon: Iconsax.money_send,
                              color: VColors.error,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: VSizes.spaceBtwItems),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                          bottom: VDeviceUtils.getScreenHeight(context) * 0.1,
                        ),
                        itemCount: detail.transactions.length,
                        itemBuilder: (_, index) {
                          final txn = detail.transactions[index];
                          return ListTile(
                            onTap: () => showEditVaultTransactionSheet(
                                context, ref, txn),
                            title: Text(
                              txn.description,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                            ),
                            leading: Icon(
                              txn.isOut
                                  ? Iconsax.money_send
                                  : Iconsax.money_recive,
                              color:
                                  txn.isOut ? VColors.error : VColors.success,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  VFormatters.formatDate(txn.date),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const SizedBox(height: VSizes.sm),
                                Text(txn.note ?? '',
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                            trailing: Text(
                              "${txn.isOut ? '-' : '+'} ${txn.amount.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: txn.isOut ? Colors.red : Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: VDeviceUtils.getScreenWidth(context) * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VaultButtons(
              isOut: false,
              onPressed: () =>
                  showVaultTransactionSheet(context, ref, vaultId, false),
            ),
            const SizedBox(width: VSizes.spaceBtwItems),
            VaultButtons(
              isOut: true,
              onPressed: () =>
                  showVaultTransactionSheet(context, ref, vaultId, true),
            ),
          ],
        ),
      ),
    );
  }
}
