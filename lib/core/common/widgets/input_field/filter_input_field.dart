import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/shop/controllers/product/all_products_controller.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    required this.valuesList,
  });

  final List<Object> valuesList;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: 'Sort By',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Icon(
          Iconsax.sort,
          // * icon color
          color: AppHelperFunctions.isDarkMode(context)
              ? Colors.grey
              : Colors.black,
        ),
      ),
      items: valuesList
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option.toString()),
              ))
          .toList(),
      value: AllProductsController.instance.selectedSortOption.value,
      onChanged: (value) {
        AllProductsController.instance.sortProducts(value.toString());
      },
    );
  }
}
