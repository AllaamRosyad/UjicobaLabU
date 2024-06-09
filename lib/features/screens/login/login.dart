import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                  ),
                  Text(
                    TTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: TSizes.sm),
                  Text(
                    TTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              //Form
              Form(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    ///Email
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email),
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Password
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields / 2),

                    ///Remember Me & Forget Password
                    Row(children: [
                      /// Remember Me
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text(TTexts.rememberMe),
                        ],
                      ),

                      ///Forgot Password
                      TextButton(
                          onPressed: () {}, child: Text(TTexts.forgetPassword))
                    ]),
                    SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Sign In Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text(TTexts.signIn))),
                    SizedBox(height: TSizes.spaceBtwItems),

                    ///Create account button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: OutlinedButton(
                                onPressed: () {},
                                child: Text(TTexts.createAccount)))),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
