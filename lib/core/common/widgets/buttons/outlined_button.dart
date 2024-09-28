import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width = double.infinity,
    this.borderColor = Colors.black,
  });
  final String label;
  final double width;
  final void Function()? onPressed;
  final Color borderColor ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          side:  BorderSide(
            color: borderColor ,
            width: 1.5,
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
