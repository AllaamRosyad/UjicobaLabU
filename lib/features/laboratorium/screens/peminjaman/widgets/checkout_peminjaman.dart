// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:t_store/features/personalization/controllers/user_controller.dart';

// class TPeminjaman extends StatelessWidget {
//   const TPeminjaman({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userController = Get.find<UserController>();
//     final String profileName = '${userController.user.value.firstName} ${userController.user.value.lastName}';

//     // Get the current date
//     final String borrowingDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

//     // Set return date to one week from now
//     final String returnDate = DateFormat('dd MMMM yyyy').format(DateTime.now().add(Duration(days: 7)));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Borrower Name
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Nama Peminjam:', style: Theme.of(context).textTheme.bodyMedium),
//             Text(profileName, style: Theme.of(context).textTheme.bodyLarge),
//           ],
//         ),
//         SizedBox(height: 16),

//         // Borrowing Date
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Tanggal Peminjaman:', style: Theme.of(context).textTheme.bodyMedium),
//             Text(borrowingDate, style: Theme.of(context).textTheme.bodyLarge),
//           ],
//         ),
//         SizedBox(height: 16),

//         // Return Date
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Tanggal Pengembalian:', style: Theme.of(context).textTheme.bodyMedium),
//             Text(returnDate, style: Theme.of(context).textTheme.bodyLarge),
//           ],
//         ),
//       ],
//     );
//   }
// }
