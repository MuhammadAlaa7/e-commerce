import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

// This is any widget you want to give it these curved edges .
class CustomClippedWidget extends StatelessWidget {
  const CustomClippedWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // * This is the [ path ] to make the shape of the clipped widget from bottom
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
