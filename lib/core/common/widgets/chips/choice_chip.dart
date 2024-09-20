import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
  });

  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    bool isColor = AppHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor
          ? const SizedBox()
          : Text(
              text,
            ),
      selected: isSelected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: isSelected ? Colors.white : null),
      backgroundColor: isColor ? AppHelperFunctions.getColor(text) : null,
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backgroundColor: AppHelperFunctions.getColor(text)!,
            )
          : null,
      shape: isColor ? CircleBorder() : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      selectedColor:
          isColor ? AppHelperFunctions.getColor(text) : AppColors.primary,
    );
  }
}
