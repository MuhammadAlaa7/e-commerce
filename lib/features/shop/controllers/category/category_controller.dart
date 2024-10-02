import 'package:get/get.dart';
import 'package:store/data/repos/category_repo.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/popups/toasts.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final categoriesRepository = Get.put(CategoryRepository());

  final Rx<bool> isLoading = false.obs;

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

// load categories data

  Future<void> fetchAllCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source [ firebase , api , local ]

      final categories = await categoriesRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories

      final featureCats = allCategories
          .where((category) =>
              category.isFeatured == true && category.parentId.isEmpty)
          .toList();

      // update the featured categories list
      featuredCategories.assignAll(featureCats);
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops! ', message: e.toString());
    } finally {
      // close loader

      isLoading.value = false;
    }
  }

  // * fetch the products for a specific category
  /// whether the category is base or sub category
  Future<List<ProductModel>> fetchProductsForCategory(String categoryId,
      {int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    }
  }

// * fetch sub categories for a specific category
  Future<List<CategoryModel>> fetchSubCategoriesForCategory(
    String categoryId,
  ) async {
    try {
      final subCategories =
          await categoriesRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    }
  }
}
