import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';


// This is any widget you want to give it these curved edges . 
class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child,);
  }
}
