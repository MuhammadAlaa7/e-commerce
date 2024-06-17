import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/chips/choice_chip.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/common/widgets/texts/read_more_text.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/rating_reviews/rating_review_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // *selected prices
        RoundedContainer(
          margin: const EdgeInsets.symmetric(vertical: CSizes.md),
          // height: 60,
          padding: const EdgeInsets.all(CSizes.md),
          backgroundColor: CHelperFunctions.isDarkMode(context)
              ? CColors.darkGrey2.withOpacity(0.8)
              : Colors.grey.withOpacity(0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Variation:  ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    width: CSizes.spaceBetweenItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Price',
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            width: CSizes.spaceBetweenItems / 2,
                          ),
                          Text(
                            '\$25.00',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const SizedBox(
                            width: CSizes.spaceBetweenItems,
                          ),
                          const ProductPriceText(
                            price: '134,00',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Stock',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(
                            width: CSizes.spaceBetweenItems,
                          ),
                          Text('In stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'This is the description of the product it can be up to 4 lines',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingSection(title: 'Colors', showActionButton: false),
            const SizedBox(
              height: CSizes.spaceBetweenItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(
                  text: 'green',
                  isSelected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  text: 'red',
                  isSelected: true,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingSection(title: 'Sizes', showActionButton: false),
            const SizedBox(
              height: CSizes.spaceBetweenItems,
            ),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(
                    text: 'EU 34', isSelected: true, onSelected: (value) {}),
                CChoiceChip(
                    text: 'EU 36', isSelected: false, onSelected: (value) {}),
                CChoiceChip(
                    text: 'EU 37', isSelected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),
        DefaultButton(
          label: 'Checkout',
          onPressed: () {},
        ),
        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),

        // * Description

        const HeadingSection(
          title: 'Description',
          showActionButton: false,
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        const CustomReadMoreText(
          text:
              'this is the description of the product it can be up to 4 lines this is the description of the product it can be up to 4 lines',
        ),
        const Divider(),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        // * Reviews
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeadingSection(
              title: 'Reviews(199)',
              showActionButton: false,
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {
                  CHelperFunctions.goTo(context, const ProductReviewScreen());
                },
                icon: const Icon(Iconsax.arrow_right_3)),
          ],
        ),
      ],
    );
  }
}










// class SizesSelectionPallette extends StatefulWidget {
//   const SizesSelectionPallette({Key? key}) : super(key: key);

//   @override
//   State<SizesSelectionPallette> createState() => _SizesSelectionPalletteState();
// }

// class _SizesSelectionPalletteState extends State<SizesSelectionPallette> {
//   // List to manage the selection state for each SizeItem
//   List<bool> isSelectedList = [false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8,
//       children: [
//         SizeItem(
//           isSelected: isSelectedList[0],
//           text: 'EU 34',
//           onSelected: (bool value) {
//             setState(() {
//               isSelectedList[0] = value;
//             });
//           },
//         ),
//         SizeItem(
//           isSelected: isSelectedList[1],
//           text: 'EU 35',
//           onSelected: (bool value) {
//             setState(() {
//               isSelectedList[1] = value;
//             });
//           },
//         ),
//         SizeItem(
//           isSelected: isSelectedList[2],
//           text: 'EU 36',
//           onSelected: (bool value) {
//             setState(
//               () {
//                 isSelectedList[2] = value;
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class SizeItem extends StatelessWidget {
//   const SizeItem({
//     Key? key,
//     required this.isSelected,
//     required this.text,
//     required this.onSelected,
//   }) : super(key: key);

//   final bool isSelected;
//   final String text;
//   final Function(bool value) onSelected;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           onSelected(!isSelected);
//         },
//         child: MyWidget());
//   }
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChoiceChip(
//       label: Text('data'),
//       selected: true,
//       showCheckmark: false,
//     );
//   }
// }

// // class SizesSelectionPallette extends StatefulWidget {
// //   const SizesSelectionPallette({super.key});

// //   @override
// //   State<SizesSelectionPallette> createState() => _SizesSelectionPalletteState();
// // }

// // class _SizesSelectionPalletteState extends State<SizesSelectionPallette> {
// //   bool isSelected = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Wrap(
// //       spacing:  8 ,
// //       children: [
// //         SizeItem(
// //           isSelected: isSelected,
// //           text: 'EU 34',
// //         ),
// //         SizeItem(
// //           isSelected: isSelected,
// //           text: 'EU 34',
// //         ),
// //         SizeItem(
// //           isSelected: isSelected,
// //           text: 'EU 34',
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class SizeItem extends StatelessWidget {
// //   const SizeItem({
// //     super.key,
// //     required this.isSelected,
// //     required this.text,
// //   });
// //   final bool isSelected;
// //   final String text;
// //   @override
// //   Widget build(BuildContext context) {
// //     return RoundedContainer(
// //       radius: 8,
// //       backgroundColor: isSelected ? Colors.blue : Colors.white,
// //       child: Center(
// //         child: Text(
// //           text,
// //           style: Theme.of(context).textTheme.labelLarge,
// //         ),
// //       ),
// //     );
// //   }
// // }
