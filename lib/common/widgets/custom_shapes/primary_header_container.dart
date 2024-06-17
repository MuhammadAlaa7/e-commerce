import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:store/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //* -- this is which clip the curves for the child below >>> [clipper]
      clipper: CustomCurvedEdges(),
      child: Container(
        // * There is no height for this custom container in order to be custom for any content in it
        color: CColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            child,
           
          ],
        ),
      ),
    );
  }
}
