import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/product_cart/add_remove_button.dart';
import 'package:t_store/common/widgets/product_cart/cart_item.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          TCartItem(),
          if (showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove Button Row with total Price
          if (showAddRemoveButtons)
            Row(
              children: [
                /// Extra Space
                SizedBox(width: 70),

                /// Add Remove Buttons
                TProductQuantityWithAddRemoveButton(),
              ],
            )
        ],
      ),
    );
  }
}
