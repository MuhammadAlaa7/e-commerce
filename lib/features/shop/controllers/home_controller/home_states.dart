import 'package:store/common/widgets/images/rounded_image.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBannerIndicatorState extends HomeStates {
  final List<RoundedImage> bannersList;
  ChangeBannerIndicatorState({required this.bannersList});
}
