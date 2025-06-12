import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/theme_providers/theme_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class VPrimaryHeaderContainer extends ConsumerWidget {
  const VPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = ref.watch(primaryColorProvider);
    return VCurvedEdgesWidget(
      child: Container(
        color: primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: VCircularContainer(
                  backgroundColor: VColors.white.withValues(alpha: 0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: VCircularContainer(
                  backgroundColor: VColors.white.withValues(alpha: 0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
