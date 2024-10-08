// import 'package:flutter/material.dart';
// import 'package:get/get_utils/get_utils.dart';
// import 'package:t_store/common/widgets/login_signup/form_divider.dart';
// import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
// import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/constants/text_strings.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ///Title
//               Text(TTexts.signupTitle,
//                   style: Theme.of(context).textTheme.headlineMedium),
//               const SizedBox(height: TSizes.spaceBtwSections),

//               ///Form
//               const TSignupform(),

//               ///Divider
//               TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
//               const SizedBox(height: TSizes.spaceBtwInputFields),

//               ///Social Buttons
//               const TSocialButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: dark ? Colors.white : Colors.black, // Warna back arrow
        ),
        backgroundColor:
            Colors.transparent, // Menghilangkan background kotak hitam
        elevation: 0, // Menghilangkan bayangan bawah AppBar
        automaticallyImplyLeading: true, // Mengaktifkan back arrow otomatis
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              const TSignupform(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              ///Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
