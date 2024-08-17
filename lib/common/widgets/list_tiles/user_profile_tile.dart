// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/common/widgets/images/t_circular_image.dart';
// import 'package:t_store/features/personalization/controllers/user_controller.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/image_strings.dart';

// class TUserProfileTile extends StatelessWidget {
//   const TUserProfileTile({
//     super.key,
//     required this.onPressed,
//   });

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     final controller = UserController.instance;
//     return ListTile(
//       leading: TCircularImage(
//         image: TImages.user,
//         //width: 50,
//         //height: 50,
//         //padding: 0,
//       ),
//       title: Text(controller.user.value.fullName,
//           style: Theme.of(context)
//               .textTheme
//               .headlineSmall!
//               .apply(color: TColors.white)),
//       subtitle: Text(controller.user.value.email,
//           style: Theme.of(context)
//               .textTheme
//               .bodyMedium!
//               .apply(color: TColors.white)),
//       trailing: IconButton(
//           onPressed: onPressed,
//           icon: const Icon(
//             Iconsax.edit,
//             color: TColors.white,
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(() {
      final networkImage = controller.user.value.profilePicture;
      final image = networkImage.isNotEmpty ? networkImage : TImages.user;

      return ListTile(
        leading: TCircularImage(
          image: image,
          width: 50, // Adjust width as needed
          height: 50, // Adjust height as needed
          padding: 0,
          isNetworkImage: networkImage.isNotEmpty,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          ),
        ),
      );
    });
  }
}
