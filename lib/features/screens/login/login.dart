import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/screens/login/widgets/login_form.dart';
import 'package:t_store/features/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/colors.dart';

// Constants
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

// Helpers
import 'package:t_store/utils/helpers/helper_functions.dart';

// Styles
import 'package:t_store/common/styles/spacing_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title,
              TLoginHeader(dark, context),

              //Form
              TLoginForm(),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(TTexts.orSignInWith.capitalize!,
                      style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: TColors.grey),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Image(
                          width: TSizes.iconMd,
                          height: TSizes.iconMd,
                          image: AssetImage(TImages.google),
                        )),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: TColors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image(
                            width: TSizes.iconMd,
                            height: TSizes.iconMd,
                            image: AssetImage(TImages.facebook),
                          )),
                    ),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
