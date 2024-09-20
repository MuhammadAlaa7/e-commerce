import 'package:get/get.dart';
import 'package:store/data/repos/category_repo.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final categoriesRepository = Get.put(CategoryRepository());

  final Rx<bool> isLoading = false.obs;
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// load categories data

  void fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source [ firebase , api , local ]

      final categories = await categoriesRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filter featured categories
      /// when the parentId is null or empty this means that the category is a parent category not a sub category
      /// it is not following the parent category so it is a parent not a sub category
      featuredCategories.assignAll(allCategories
          .where((category) =>
              category.isFeatured == true && category.parentId.isEmpty)
          .toList());
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
    } finally {
      // close loader

      isLoading.value = false;
    }
  }

  // * fetch the products for a specific category
  Future<List<ProductModel>> fetchProductsForCategory(String categoryId,
      {int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
      return [];
    }
  }

// * fetch sub categories for a specific category
  Future<List<CategoryModel>> fetchSubCategoriesForCategory(
      String categoryId) async {
    try {
      final subCategories =
          await categoriesRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
      return [];
    }
  }
}
