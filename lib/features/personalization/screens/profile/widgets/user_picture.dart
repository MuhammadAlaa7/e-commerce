import 'package:flutter/widgets.dart';
import 'package:store/common/widgets/buttons/text_button.dart';
import 'package:store/common/widgets/images/circular_image.dart';
import 'package:store/utils/constants/image_strings.dart';

class UserPictureSection extends StatelessWidget {
  const UserPictureSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const CircularImage(
              image: CImages.userProfile, width: 80, height: 80),
          CustomTextButton(
            label: 'Change Profile Picture',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
