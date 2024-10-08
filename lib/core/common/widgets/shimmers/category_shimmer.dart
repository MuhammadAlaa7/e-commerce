import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CustomCategoriesShimmer extends StatelessWidget {
  const CustomCategoriesShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: AppSizes.spaceBetweenItems);
        },
        itemBuilder: (BuildContext context, int index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              CustomShimmerEffect(
                height: 56,
                width: 56,
                radius: 56,
              ),
              SizedBox(
                height: AppSizes.spaceBetweenItems / 2,
              ),
              // text
              CustomShimmerEffect(
                height: 8,
                width: 56,
              ),
            ],
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
