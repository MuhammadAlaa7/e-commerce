import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/utils/helper/helper_functions.dart';

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
    bool isColor = CHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: isSelected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: isSelected ? Colors.white : null),
      color: isColor
          ? MaterialStateProperty.all(CHelperFunctions.getColor(text))
          : null,
      avatar: isColor
          ? const CircularContainer(
              width: 50,
              height: 50,
              //  backgroundColor: Colors.red,
            )
          : null,
      //selectedColor: CHelperFunctions.getColor(text),
      labelPadding: isColor ? EdgeInsets.zero : null,
      shape: isColor ? const CircleBorder() : null,
      //  backgroundColor: isColor ? CHelperFunctions.getColor(text) : null,
    );
  }
}
