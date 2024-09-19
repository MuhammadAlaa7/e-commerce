import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/utils/constants22/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title, subTitle , image;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CustomCircularImage(
        height: 50,
        width: 50,
        padding: 0,
        image: image,
        isNetworkImage: image.isNotEmpty,  // see , if the image is not empty so it is a network  , if empty it is a local image
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: Colors.white),
      ),
      subtitle: Text(
        subTitle,
        style:
            Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
