import 'package:flutter/material.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({
    super.key,
    this.color,
    required this.onPressed,
    required this.icon,
  });
  final Color? color;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color ?? (isDark ? Colors.white : Colors.black),
          ),
        ),
        Positioned(
          right: 2,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.titleLarge!.apply(
                      color: isDark ? Colors.black : Colors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
