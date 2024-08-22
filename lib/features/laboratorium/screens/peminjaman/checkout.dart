// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:t_store/common/widgets/appbar/appbar.dart';
// import 'package:t_store/common/widgets/success_screen/success_screen.dart';
// import 'package:t_store/features/laboratorium/screens/cart/widgets/cart_items.dart';
// import 'package:t_store/features/laboratorium/screens/home/widgets/rounded_container.dart';
// import 'package:t_store/features/laboratorium/screens/peminjaman/widgets/checkout_peminjaman.dart';
// import 'package:t_store/navigation_menu.dart';
// import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: TAppBar(
//           showBackArrow: true,
//           title:
//               Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Items in cart
//               TCartItems(showAddRemoveButtons: false),
//               SizedBox(height: TSizes.spaceBtwSections),

//               /// Peminjaman Section
//               TRoundedContainer(
//                 showBorder: true,
//                 padding: EdgeInsets.all(TSizes.md),
//                 backgroundColor: dark ? TColors.black : TColors.white,
//                 child: Column(
//                   children: [
//                     /// Peminjaman
//                     TPeminjaman(),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(TSizes.defaultSpace),
//         child: ElevatedButton(
//             onPressed: () => Get.to(() => SuccessScreen(
//                   image: TImages.successfulPaymentIcon,
//                   title: 'Peminjaman Success!',
//                   subTitle:
//                       'Mohon barang dijaga dengan baik & dikembalikan tepat waktu',
//                   onPressed: () => Get.offAll(() => NavigationMenu()),
//                 )),
//             child: Text('Peminjaman')),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/laboratorium/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Unfocus any text fields when tapped outside
      },
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Items in cart
                TCartItems(showAddRemoveButtons: false),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () =>
                _showBorrowingDialog(context), // Show dialog directly
            child: Text('Peminjaman'),
          ),
        ),
      ),
    );
  }

  void _showBorrowingDialog(BuildContext context) {
    final userController = Get.find<UserController>();
    final profileName = userController.user.value.firstName +
        ' ' +
        userController.user.value.lastName;
    DateTime borrowingDate = DateTime.now();
    DateTime returnDate = DateTime.now()
        .add(Duration(days: 7)); // Default return date is 7 days from now

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Peminjaman Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nama: $profileName'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              'Tanggal Peminjaman: ${DateFormat('yyyy-MM-dd').format(borrowingDate)}')),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: borrowingDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null &&
                              pickedDate != borrowingDate) {
                            setState(() {
                              borrowingDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                              'Tanggal Pengembalian: ${DateFormat('yyyy-MM-dd').format(returnDate)}')),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: returnDate,
                            firstDate:
                                borrowingDate, // Return date can't be before borrowing date
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null && pickedDate != returnDate) {
                            setState(() {
                              returnDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(() => SuccessScreen(
                          image: TImages.successfulPaymentIcon,
                          title: 'Peminjaman Success!',
                          subTitle:
                              'Mohon barang dijaga dengan baik & dikembalikan tepat waktu',
                          onPressed: () => Get.offAll(() => NavigationMenu()),
                        ));
                  },
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
