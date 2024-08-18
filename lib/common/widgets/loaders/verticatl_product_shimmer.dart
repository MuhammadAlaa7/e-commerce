import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount ,
  });
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    return CustomGridView(
        itemCount:itemCount ?? 0,
        itemBuilder: (_, index) {
          return const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * image
                CustomShimmerEffect(height: 180, width: 180),
                SizedBox(
                  height: CSizes.spaceBetweenItems,
                ),

                // * text
                CustomShimmerEffect(height: 15, width: 160),
                SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                CustomShimmerEffect(height: 15, width: 110),
              ],
            ),
          );
        });
  }
}
