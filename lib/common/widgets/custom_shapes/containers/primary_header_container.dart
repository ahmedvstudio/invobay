import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class VPrimaryHeaderContainer extends StatelessWidget {
  const VPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return VCurvedEdgesWidget(
      child: Container(
        color: VColors.kPrimary,
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
