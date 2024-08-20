import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/section_heading/section_heading.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Info
              TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onPressed: () {}),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '19 Februari 2002',
                  onPressed: () {}),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text('Close Account',
                        style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
