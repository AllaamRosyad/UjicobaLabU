import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/common/widgets/product_cart/add_remove_button.dart';
import 'package:t_store/common/widgets/product_cart/cart_item.dart';
import 'package:t_store/features/laboratorium/controllers/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                /// Cart Item
                TCartItem(cartItem: item),
                if (showAddRemoveButtons)
                  SizedBox(height: TSizes.spaceBtwItems),

                /// Add Remove Button Row with total Price
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /// Extra space
                          SizedBox(width: 70),

                          /// Add remove Buttons
                          TProductQuantityWithAddRemoveButton(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () =>
                                  cartController.removeOneFromCart(item))
                        ],
                      )
                    ],
                  )
              ],
            );
          }),
          separatorBuilder: (_, __) =>
              SizedBox(height: TSizes.spaceBtwSections),
        ));
  }
}
