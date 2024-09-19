import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/utils/constants22/sizes.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 300,
    this.mainAxisSpacing,
    required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final double? mainAxisSpacing;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // * Delegate is the controller of the GridView to handle the spacing and size of the items
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //  mainAxisSpacing: CSizes.gridViewSpacing / 2,
        crossAxisSpacing: CSizes.gridViewSpacing,
        mainAxisSpacing: mainAxisSpacing ?? 0,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
