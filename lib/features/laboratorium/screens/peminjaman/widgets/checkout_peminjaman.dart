import 'package:flutter/material.dart';

class TPeminjaman extends StatelessWidget {
  const TPeminjaman({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('Peminjaman', style: Theme.of(context).textTheme.bodyMedium),
          ],
        )

        ///
      ],
    );
  }
}
