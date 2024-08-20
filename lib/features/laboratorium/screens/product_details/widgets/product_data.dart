// import 'package:flutter/material.dart';
// import 'package:t_store/common/widgets/texts/product_title_text.dart';
// import 'package:t_store/utils/constants/sizes.dart';
// import 'package:t_store/utils/helpers/helper_functions.dart';

// import 'package:flutter/material.dart';

// class TProductData extends StatelessWidget {
//   const TProductData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final darkmode = THelperFunctions.isDarkMode(context);
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title
//             Text(
//               'Green Nike Sport Shirt',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: TSizes.spaceBtwItems),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductData extends StatelessWidget {
  const TProductData({super.key});

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
              'Green Nike Sport Shirt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            // Stock Information
            Text(
              'In Stock: 25 items',
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
