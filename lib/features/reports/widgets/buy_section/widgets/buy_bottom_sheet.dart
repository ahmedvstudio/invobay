import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';

import '../../../../../core/utils/constants/sizes.dart';

class ReportBottomSheet<T> extends ConsumerWidget {
  final String title;
  final AutoDisposeStreamProvider<List<T>> provider;
  final Widget Function(T data, int index) itemBuilder;

  const ReportBottomSheet({
    super.key,
    required this.title,
    required this.provider,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(provider);

    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(title: title, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            dataAsync.when(
              data: (items) => items.isEmpty
                  ? const Padding(
                      padding: VSpacingStyle.vertical,
                      child: Text('No data available.'),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) =>
                            itemBuilder(items[index], index),
                      ),
                    ),
              loading: () => const Padding(
                padding: VSpacingStyle.vertical,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Padding(
                padding: VSpacingStyle.vertical,
                child: Text('Error: $e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
