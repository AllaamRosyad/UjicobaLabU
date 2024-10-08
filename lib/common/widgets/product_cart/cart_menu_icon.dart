// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/features/laboratorium/screens/cart/cart.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class TCartCounterIcon extends StatelessWidget {
//   const TCartCounterIcon({
//     super.key,
//     required this.onPressed,
//     this.iconColor,
//     this.counterBgColor,
//     this.counterTextColor,
//   });

//   final VoidCallback onPressed;
//   final Color? iconColor, counterBgColor, counterTextColor;

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Stack(
//       children: [
//         IconButton(
//             onPressed: () => Get.to(() => CartScreen()),
//             icon: Icon(Iconsax.shopping_bag, color: iconColor)),
//         Positioned(
//             right: 0,
//             //top: 0,
//             child: Container(
//               width: 18,
//               height: 18,
//               decoration: BoxDecoration(
//                   color:
//                       counterBgColor ?? (dark ? TColors.white : TColors.black),
//                   borderRadius: BorderRadius.circular(100)),
//               child: Center(
//                 child: Text(
//                   '2',
//                   style: Theme.of(context).textTheme.labelLarge!.apply(
//                         color: counterTextColor ??
//                             (dark ? TColors.black : TColors.white),
//                         fontSizeFactor: 0.0,
//                       ),
//                 ),
//               ),
//             ))
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/laboratorium/controllers/cart_controller.dart';
import 'package:t_store/features/laboratorium/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => CartScreen(showBackArrow: true)),
            icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          //top: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: counterTextColor ??
                            (dark ? TColors.black : TColors.white),
                        fontSize: 12, // Adjust font size to be more visible
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
