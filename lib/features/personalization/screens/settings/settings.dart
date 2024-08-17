import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        /// Header
        TPrimaryHeaderContainer(
            child: Column(
          children: [
            TAppBar(
                title: Text(
              'Account',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: TColors.white),
            )),

            /// User Profile Card
            TUserProfileTile(
                onPressed: () => Get.to(() => const ProfileScreen())),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        )),

        /// Body
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Account Settings
              const TSectionHeading(
                title: 'Account Settings',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSettingMenuTile(
                icon: Iconsax.safe_home,
                title: 'My Addressess',
                subTitle: 'Set shopping delivery address',
                onTap: () => Get.to(() => UserAddressScreen()),
              ),
              TSettingMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'My Cart',
                subTitle: 'Add, remove products and move to checkout',
                onTap: () {},
              ),
              TSettingMenuTile(
                icon: Iconsax.bag_tick,
                title: 'My Orders',
                subTitle: 'In-Progress and Completed Orders',
                onTap: () {},
              ),
              TSettingMenuTile(
                icon: Iconsax.notification,
                title: 'Notifications',
                subTitle: 'Set any kind of notification message',
                onTap: () {},
              ),
              TSettingMenuTile(
                icon: Iconsax.security_card,
                title: 'Account Privacy',
                subTitle: 'Manage data usage and connected accounts',
                onTap: () {},
              ),

              /// App Setting
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSectionHeading(
                  title: 'App Settings', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSettingMenuTile(
                icon: Iconsax.document_upload,
                title: 'Load Data',
                subTitle: 'Upload Data to your cloud firebase',
                onTap: () {},
              ),

              /// Logout Button
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () async {
                      await AuthenticationRepository.instance.logout();
                    },
                    child: const Text('Logout')),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        )
      ],
    )));
  }
}
