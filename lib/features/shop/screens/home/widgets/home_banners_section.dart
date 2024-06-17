import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class HomeBannerSection extends StatefulWidget {
  const HomeBannerSection({
    super.key,
    required this.banners,
  });

  final List<Widget> banners;

  @override
  State<HomeBannerSection> createState() => _HomeBannerSectionState();
}

class _HomeBannerSectionState extends State<HomeBannerSection> {
  int currentBannerIndex = 0;
  // * -- change banner indicator
  void changeBannerIndex(int index) {
    setState(() {
      currentBannerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners,
          options: CarouselOptions(
            // -- this is also responsible for separating the items in the slider with a space between them
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, _) {
              changeBannerIndex(index);
            },
          ),
        ),
        const SizedBox(height: CSizes.spaceBetweenSections),

        // * -- banner indicators

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.banners.length; i++)
              CircularContainer(
                margin: const EdgeInsets.only(right: 10),
                height: 6,
                width: 20,
                backgroundColor: currentBannerIndex == i
                    ? CColors.primary
                    : Colors.grey[400]!,
              ),
          ],
        ),
      ],
    );
  }
}
