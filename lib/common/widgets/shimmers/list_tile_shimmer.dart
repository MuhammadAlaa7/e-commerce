import 'package:flutter/material.dart';
import 'package:store/common/widgets/shimmers/shimmer_effect.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Row(children: [
      CustomShimmerEffect(height: 50, width: 50 , radius: 50,),
       SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShimmerEffect(height: 10, width: 100,),
           SizedBox(height: 5,),
          CustomShimmerEffect(height: 10, width: 60,),
        ],
      ) ,
    ],);
  }
}