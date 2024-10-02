import 'package:flutter/widgets.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';

class FeaturedBrandsShimmer extends StatelessWidget {
  const FeaturedBrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomShimmerEffect(height: 20, width: 100),
              CustomShimmerEffect(height: 20, width: 60),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomGridView(
            itemCount: 4,
            mainAxisExtent: 80,
            itemBuilder: (context, index) {
              return const CustomShimmerEffect(
                height: 20,
                width: 100,
              );
            }),
      ],
    );
  }
}
