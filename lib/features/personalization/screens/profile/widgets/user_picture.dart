import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/features/personalization/controllers/user/user_controller.dart';
import 'package:store/utils/constants/image_strings.dart';

class UserPictureSection extends StatelessWidget {
  const UserPictureSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Obx(
            () {
              // get the profile picture path stored in the current user
              final networkImage = userController.user.value.profilePicture;
              // check if there is a picture in the user , if not show the default image
              final image =
                  networkImage.isNotEmpty ? networkImage : CImages.userProfile;

              return userController.profileLoading.value
                  ? const CustomShimmerEffect(
                      width: 55,
                      height: 55,
                      radius: 100,
                    )
                  : CustomCircularImage(
                      fit: BoxFit.cover,
                      image: image,
                      width: 100,
                      height: 100,
                      isNetworkImage: networkImage.isNotEmpty,
                    );
            },
          ),
          CustomTextButton(
            label: 'Change Profile Picture',
            onPressed: () {
              UserController.instance.uploadUserProfileImage();
            },
          )
        ],
      ),
    );
  }
}
