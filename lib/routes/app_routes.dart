import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/laboratorium/screens/Inventory/Inventory.dart';
import 'package:t_store/features/laboratorium/screens/cart/cart.dart';
import 'package:t_store/features/laboratorium/screens/home/home.dart';
import 'package:t_store/features/laboratorium/screens/iot/led_screen.dart';
import 'package:t_store/features/laboratorium/screens/peminjaman/checkout.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => Inventory()),
    GetPage(name: TRoutes.favourites, page: () => LedControlScreen()),
    GetPage(name: TRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: TRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}
