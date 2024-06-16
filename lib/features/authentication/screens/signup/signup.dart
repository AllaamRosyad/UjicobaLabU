import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets.login_signup/form_divider.dart';
import 'package:t_store/common/widgets.login_signup/social_buttons.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              Form(
                  child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        expands: false,
                        decoration: InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                ///Username
                TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.username,
                      prefixIcon: Icon(Iconsax.user_edit)),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                ///Email
                TextFormField(
                  decoration: InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct)),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                ///Phone Number
                TextFormField(
                  decoration: InputDecoration(
                      labelText: TTexts.phoneNo,
                      prefixIcon: Icon(Iconsax.call)),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),

                ///Password
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Terms&Conditions Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                        width:
                            8), // Adding some space between the checkbox and the text
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${TTexts.iAgreeTo}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: TTexts.privacyPolicy,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary,
                                  ),
                            ),
                            TextSpan(
                              text: '${TTexts.and}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: TTexts.termsOfUse,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                ///Sign up button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text(TTexts.createAccount)))
              ])),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Social Buttons
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
