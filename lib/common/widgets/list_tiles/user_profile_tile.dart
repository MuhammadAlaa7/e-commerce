import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/images/circular_image.dart';
import 'package:store/utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        height: 50,
        width: 50,
        padding: 0,
        image: CImages.userProfile,
      ),
      title: Text(
        'Muhammad Alaa',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: Colors.white),
      ),
      subtitle: Text(
        'alaaklug@gmail.com',
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
