import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';

class AllBrandsShimmer extends StatelessWidget {
  const AllBrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomGridView(
        itemCount: 10,
        mainAxisExtent: 80,
        itemBuilder: (context, index) {
          return const CustomShimmerEffect(height: 80, width: 100);
        },
      ),
    );
  }
}
