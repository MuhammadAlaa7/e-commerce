import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/core/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/core/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        // * There is no height for this custom container in order to be custom for any content in it
        color: AppColors.primary,
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
