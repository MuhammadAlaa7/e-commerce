//**
// the idea is you tap on the item so you select it so you have to tell the app that you selected it
// you tell it by setting the state of the selectedIndex variable to the index of the tapped item
//   you tap on the item >> you set the selectedIndex equal to the index of the tapped item
//because you selected it so you need this item with this index
// the bool variable isSelected is true if the selectedIndex is equal to the index of the tapped item
// in the same meaning >> isSelected variable is true when the item is pressed

// */

import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class ColorsSelectionPallette extends StatefulWidget {
  const ColorsSelectionPallette({super.key});

  @override
  State<ColorsSelectionPallette> createState() =>
      _ColorsSelectionPalletteState();
}

class _ColorsSelectionPalletteState extends State<ColorsSelectionPallette> {
  //* Don't put this variable in the build method
  int selectedIndex = -1;
  // -1 means no item is selected
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < 8; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = i;
              });
            },
            child: ColorItem(
              color: colors[i],
              isSelected: i == selectedIndex,
            ),
          ),
      ],
    );
  }
}

//**
// the idea is you tap on the item so you select it so you have to tell the app that you selected it
// you tell it by setting the state of the selectedIndex variable to the index of the tapped item
//   you tap on the item >> you set the selectedIndex equal to the index of the tapped item
//because you selected it so you need this item with this index
// the bool variable isSelected is true if the selectedIndex is equal to the index of the tapped item
// in the same meaning >> isSelected variable is true when the item is pressed

// */

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: color,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 35,
      height: 35,
      radius: 100,
      showBorder: true,
      child: isSelected
          ? Icon(Icons.check,
              color: AppHelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black)
          : null,
    );
  }
}
