// order shimmer
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // create the shimmer effect for a vertical boxes shimmer
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return const CustomShimmerEffect(
            height: 100,
            width: double.infinity,
            radius: 10,
          );
        });
  }
}
