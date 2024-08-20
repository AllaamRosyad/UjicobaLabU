// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
// import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
// import 'package:t_store/features/authentication/screens/signup/signup.dart';
// import 'package:t_store/navigation_menu.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/constants/text_strings.dart';
// import 'package:t_store/utils/validators/validation.dart';

// Form TLoginForm() {
//   final controller = Get.put(LoginController());
//   return Form(
//       key: controller.loginFormKey,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
//         child: Column(
//           children: [
//             ///Email
//             TextFormField(
//               controller: controller.email,
//               validator: (value) => TValidator.validateEmail(value),
//               decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.direct_right),
//                   labelText: TTexts.email),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFields),

//             ///Password
//             ///Password
//             Obx(
//               () => TextFormField(
//                 controller: controller.password,
//                 validator: (value) => TValidator.validatePassword(value),
//                 obscureText: controller.hidePassword.value,
//                 decoration: InputDecoration(
//                   labelText: TTexts.password,
//                   prefixIcon: const Icon(Iconsax.password_check),
//                   suffixIcon: IconButton(
//                     onPressed: () => controller.hidePassword.value =
//                         !controller.hidePassword.value,
//                     icon: Icon(controller.hidePassword.value
//                         ? Iconsax.eye_slash
//                         : Iconsax.eye),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFields / 2),

//             ///Remember Me & Forget Password
//             Row(children: [
//               /// Remember Me
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Obx(
//                     () => Checkbox(
//                         value: controller.rememberMe.value,
//                         onChanged: (value) => controller.rememberMe.value =
//                             !controller.rememberMe.value),
//                   ),
//                   const Text(TTexts.rememberMe),
//                 ],
//               ),

//               ///Forgot Password
//               TextButton(
//                   onPressed: () => Get.to(() => const ForgetPassword()),
//                   child: const Text(TTexts.forgetPassword))
//             ]),
//             const SizedBox(height: TSizes.spaceBtwInputFields),

//             ///Sign In Button
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () => controller.emailAndPasswordSignIn(),
//                     child: const Text(TTexts.signIn))),
//             const SizedBox(height: TSizes.spaceBtwItems),

//             ///Create account button
//             SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {},
//                     child: OutlinedButton(
//                         onPressed: () => Get.to(() => const SignupScreen()),
//                         child: const Text(TTexts.createAccount)))),
//             const SizedBox(height: TSizes.spaceBtwSections),
//           ],
//         ),
//       ));
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);

    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menambahkan padding antara teks dan field E-mail
          Padding(
            padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password Field
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) =>
                          controller.rememberMe.value = value ?? false,
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const ForgetPassword()),
                child: Text(TTexts.forgetPassword),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.emailAndPasswordSignIn(),
              child: Text(TTexts.signIn),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),

          /// Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: Text(TTexts.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
