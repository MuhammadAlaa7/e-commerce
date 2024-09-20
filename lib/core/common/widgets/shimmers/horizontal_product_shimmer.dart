import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/utils/constants/sizes.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.spaceBetweenSections),
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: AppSizes.spaceBetweenItems,
            );
          },
          itemBuilder: (context, index) {
            return const Row(
              children: [
                // image
                CustomShimmerEffect(height: 120, width: 120),
                SizedBox(
                  width: AppSizes.spaceBetweenItems,
                ),
                // text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: AppSizes.spaceBetweenItems / 2,
                    ),
                    CustomShimmerEffect(height: 15, width: 160),
                    SizedBox(
                      height: AppSizes.spaceBetweenItems / 2,
                    ),
                    CustomShimmerEffect(height: 15, width: 110),
                    SizedBox(
                      height: AppSizes.spaceBetweenItems / 2,
                    ),
                    CustomShimmerEffect(height: 15, width: 80),
                    Spacer(),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
