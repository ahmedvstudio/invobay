import 'package:flutter/material.dart';

import 'curved_edges.dart';

class VCurvedEdgesWidget extends StatelessWidget {
  const VCurvedEdgesWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: VCustomCurvedEdges(), child: child);
  }
}
