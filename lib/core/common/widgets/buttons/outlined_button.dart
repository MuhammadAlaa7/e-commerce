import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width = double.infinity,
  });
  final String label;
  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            width: 1.5,
            color: AppHelperFunctions.isDarkMode(context)
                ? Colors.white
                : Colors.black,
            style: BorderStyle.solid,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
