import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:store/core/utils/constants/colors.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 2,
      trimMode: TrimMode
          .Line, // you have to mention the mode so that the timelines works
      trimExpandedText: 'show less',
      trimCollapsedText: 'show more',
      moreStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary),
      lessStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary),
    );
  }
}
