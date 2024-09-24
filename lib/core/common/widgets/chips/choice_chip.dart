import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
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
      //* to make all colored circles have the same size , because there is no padding 
      // * and the only item that have avatar will get the size of that avatar 
      // * so I fixed the avatar for all items
      // * the avatar icon appears only for selected item 
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backgroundColor: AppHelperFunctions.getColor(text)!,
            )
          : null,  
      shape: isColor
          ? const CircleBorder()
          : null, // * null here will be the default chip shape
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      selectedColor:
          isColor ? AppHelperFunctions.getColor(text) : AppColors.primary,
    );
  }
}
