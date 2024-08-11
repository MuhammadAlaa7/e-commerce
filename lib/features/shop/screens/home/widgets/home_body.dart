import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/loaders/verticatl_product_shimmer.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import 'home_banners_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    // final isDark = CHelperFunctions.isDarkMode(context);
    return Padding(
      // *-- padding 16 pixels
      padding: const EdgeInsets.symmetric(horizontal: CSizes.sm),
      child: Column(
        children: [
          // * -- banner section
          const HomeBannerSection(),

          const SizedBox(height: CSizes.spaceBetweenSections),
          // * -- popular products section
          HeadingSection(
            title: 'Popular Products',
            onPressed: () {
              CHelperFunctions.goTo(context, const AllProductsScreen());
            },
          ),

          Obx(
            () {
              if (controller.isLoading.value == true) {
                return const VerticalProductShimmer();
              }
              if (controller.featuredProducts.isEmpty == true) {
                return const Text('No Products Found');
              } else {
                return CustomGridView(
                  itemCount: 4,
                  itemBuilder: (_, index) => VerticalProductCard(
                    product: controller.featuredProducts[index],
                  ),
                );
              }
            },
          ),
          // ProductCardVertical(),
        ],
      ),
    );
  }
}

// class HomeBannerSection extends StatelessWidget {
//   const HomeBannerSection({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<
//         HomeCubit>(); // this is the same as BlocProvider.of<HomeCubit>(context)
//     return BlocBuilder<HomeCubit, HomeStates>(
//       builder: (context, state) {
//         if (state is ChangeBannerIndicatorState) {
//           return Column(
//             children: [
//               CarouselSlider(
//                 items: state.bannersList,
//                 options: CarouselOptions(
//                   enlargeCenterPage: true,
//                   viewportFraction: 1,
//                   onPageChanged: (index, _) {
//                     cubit.changeBannerIndex(index);
//                   },
//                 ),
//               ),
//               const SizedBox(height: CSizes.spaceBetweenSections),

//               // * -- banner indicators

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (int i = 0; i < state.bannersList.length; i++)
//                     CircularContainer(
//                       margin: const EdgeInsets.only(right: 10),
//                       height: 6,
//                       width: 3,
//                       backgroundColor: cubit.currentBannerIndex == i
//                           ? CColors.primary
//                           : Colors.grey[400]!,
//                     ),
//                 ],
//               ),
//             ],
//           );
//         } else {
//           return Column(
//             children: [
//               CarouselSlider(
//                 items: [
//                   RoundedImage(imageUrl: CImages.banner1),
//                   RoundedImage(imageUrl: CImages.banner2),
//                   RoundedImage(imageUrl: CImages.banner3)
//                 ],
//                 options: CarouselOptions(
//                   enlargeCenterPage: true,
//                   viewportFraction: 1,
//                   onPageChanged: (index, _) {
//                     cubit.changeBannerIndex(index);
//                   },
//                 ),
//               ),
//               const SizedBox(height: CSizes.spaceBetweenSections),

//               // * -- banner indicators

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (int i = 0; i < 3; i++)
//                     CircularContainer(
//                       margin: const EdgeInsets.only(right: 10),
//                       height: 6,
//                       width: 3,
//                       backgroundColor: cubit.currentBannerIndex == i
//                           ? CColors.primary
//                           : Colors.grey[400]!,
//                     ),
//                 ],
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
