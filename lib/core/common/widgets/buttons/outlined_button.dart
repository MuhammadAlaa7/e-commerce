import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';

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
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
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
