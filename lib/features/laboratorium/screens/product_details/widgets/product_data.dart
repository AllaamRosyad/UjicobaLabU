import 'package:flutter/material.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductData extends StatelessWidget {
  const TProductData({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkmode = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              product.title, // Use product's title
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            // Stock Information
            Text(
              'In Stock: ${product.stock} items', // Use product's stock
              style: TextStyle(
                fontSize: 16,
                color: darkmode ? Colors.white70 : Colors.black54,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ],
    );
  }
}
