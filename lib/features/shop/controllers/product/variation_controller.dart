import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/features/shop/models/product_model.dart';

import '../../models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

// - variables
  RxMap selectedAttributes = {}.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;
  RxString variationStockStatus = ''.obs;

  /// select attribute and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    log('attributeName: $attributeName, attributeValue: $attributeValue');
    /* 
    Why Do It This Way?
 - Reactive Variables:
The original selectedAttributes is reactive. Directly modifying it might trigger changes in the UI before the new selection process is complete.
 - Avoiding Side Effects:
By working on a copy first, the code ensures that changes are only applied once they’re fully determined.
     */
    // this creates a copy of selectedAttributes and modifies it without changing the original
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    // update the copy with the new selection values  >> key : value >> e.g. ['Color' : 'Green']
    selectedAttributes[attributeName] = attributeValue;
      // Assign the updated map back to the RxMap selectedAttributes to update the UI

    this.selectedAttributes[attributeName] = attributeValue;

// ***************

// check if there is a variation that matches the selected attributes in the product variations
// it returns the first matching variation model
    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => isMatchInAttributeValues(
        variation.attributeValues,
        selectedAttributes,
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    // show the selected variation image as main large image
    if (selectedVariation.image.isNotEmpty) {
      ProductImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    // assign selected variation as current selected variation
    this.selectedVariation.value = selectedVariation;
    log('selected variation: ${selectedVariation.attributeValues}');
    getProductVariationStockStatus();
  }

  /// check if selected attributes match any variation attributes
  bool isMatchInAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // if selected attributes contain 3 attributes and current variation contains only 2 then return
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    // if any attribute is different then return  >> e.g.    [Green , Large] X [Green , Small]
    for (final key in variationAttributes.keys) {
      // attributes[key] = value >> which could be [ green , small , Cotton ] etc
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

// check attribute availability / stock  in variation
// This method checks which attribute values are available for a given attribute name
// across all variations of a product that are in stock.
//This method's job is to find out which values of a specific attribute (like "color" or "size")
//are available in the product variations that are in stock.
// *----------------
/* 
Let's say you're looking at a shirt that comes in three colors: Red, Green, and Blue.
 But currently, only Red and Green are in stock. 
 This method will return a set containing just {"Red", "Green"}.
 */
//*----------------
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // pass the variation to check  which attributes are available  and stock is not 0
    final availableVariationAttributeValues = variations
        // where just filter the variations that match the test condition
        // it returns list of product variation models
        .where((variation) {
          // check empty / out of stock attributes
          // return the variation that matches the test condition following
          return variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0;
        }
            // fetch all non empty attributes of variations
            // after filtering the variations ,
            )
        .map(
          (variation) => variation.attributeValues[attributeName],
        )
        .toSet();

    return availableVariationAttributeValues;
  }

// get the variation price 
String getVariationPrice() {
  return (selectedVariation.value.salePrice > 0 ?  selectedVariation.value.salePrice : selectedVariation.value.price).toString();
}


// check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }
}
