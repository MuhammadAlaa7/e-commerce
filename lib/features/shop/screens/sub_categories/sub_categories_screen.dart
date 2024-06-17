import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.md),
          child: Column(
            children: [
              // * Banner Section

              const RoundedImage(imageUrl: CImages.banner3),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),

              //  * sub categories section
              HeadingSection(
                title: 'Sports Shoes',
                onPressed: () {},
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              const SportsSectionOne(),
            ],
          ),
        ),
      ),
    );
  }
}

class SportsSectionOne extends StatelessWidget {
  const SportsSectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      //width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return const HorizontalProductCard();
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: CSizes.sm,
          );
        },
        itemCount: 16,
      ),
    );
  }
}
