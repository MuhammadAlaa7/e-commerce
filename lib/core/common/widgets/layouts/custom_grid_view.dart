import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 300,
    this.mainAxisSpacing = AppSizes.gridViewSpacing,
    this.crossAxisSpacing = AppSizes.gridViewSpacing,
    required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final double mainAxisSpacing, crossAxisSpacing;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // * Delegate is the controller of the GridView to handle the spacing and size of the items
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // the number of items horizontally
        crossAxisSpacing: crossAxisSpacing ,
        mainAxisSpacing: mainAxisSpacing ,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
