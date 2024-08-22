import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/laboratorium/controllers/cart_controller.dart';
import 'package:t_store/features/laboratorium/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, this.showBackArrow = false}) : super(key: key);

  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: showBackArrow,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Keranjang Kosong',
          animation: TImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TCartItems(),
            ),
          );
        }
      }),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () =>
              _showBorrowingDialog(context), // Show the dialog directly
          child: Text('Peminjaman'),
        ),
      ),
    );
  }

  void _showBorrowingDialog(BuildContext context) {
    final userController = Get.find<UserController>();
    final cartController = Get.find<CartController>();

    final profileName =
        '${userController.user.value.firstName} ${userController.user.value.lastName}';

    // Calculate total quantity of items in the cart
    final totalItemsQuantity = cartController.cartItems
        .fold<int>(0, (previousValue, item) => previousValue + item.quantity);

    final borrowedItems = cartController.cartItems
        .map((item) => '${item.title} (x${item.quantity})')
        .toList();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $profileName'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Text('Total Barang: $totalItemsQuantity'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Text('Nama Barang:'),
                  ...borrowedItems.map((item) => Text('- $item')).toList(),
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
