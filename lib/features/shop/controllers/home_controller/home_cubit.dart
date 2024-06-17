import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/features/shop/controllers/home_controller/home_states.dart';
import 'package:store/utils/constants/image_strings.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

int currentBannerIndex = 0;

final List<RoundedImage> bannersList = const [
    RoundedImage(imageUrl: CImages.banner1),
    RoundedImage(imageUrl: CImages.banner2),
    RoundedImage(imageUrl: CImages.banner3),
    RoundedImage(imageUrl: CImages.banner4),
    RoundedImage(imageUrl: CImages.banner5),
    RoundedImage(imageUrl: CImages.banner6),
    RoundedImage(imageUrl: CImages.banner7),
    RoundedImage(imageUrl: CImages.banner8),
  ]; 
  void changeBannerIndex(int index) {   


    currentBannerIndex = index;

    emit(ChangeBannerIndicatorState(bannersList: bannersList));
  }
}