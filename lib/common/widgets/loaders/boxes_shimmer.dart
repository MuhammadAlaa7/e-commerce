import 'package:flutter/material.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: CustomShimmerEffect(
          height: 100,
          width: 100,
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: CustomShimmerEffect(
          height: 100,
          width: 100,
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: CustomShimmerEffect(
          height: 100,
          width: 100,
        )),
      ],
    );
  }
}
