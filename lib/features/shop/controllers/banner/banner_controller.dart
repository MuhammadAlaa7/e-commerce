import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/data/repos/banner_repo.dart';
import 'package:store/features/shop/models/banner_model.dart';

import 'package:store/core/utils/popups/toasts.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

// dummy data for assets

// variables --
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxBool isLoading = false.obs;
  RxInt currentBannerIndex = 0.obs;

  final bannerRepo = Get.put(BannerRepository());
  @override
  void onInit() {
    super.onInit();

    fetchBanners();
  }

  ///* change banner index
  void changeBannerIndex(index) {
    currentBannerIndex.value = index;
  }

  ///* fetch all banners

  Future<void> fetchBanners() async {
    try {
      /// start loading

      isLoading.value = true;

      /// fetch banners from data source [ firebase , api , local ]

      final banners = await bannerRepo.getAllBanners();

      /// update the banners list

      this.banners.assignAll(banners);
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
