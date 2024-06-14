import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(

            ///Padding to Give Default Equal Space on all sides in all screens.
            child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image

              ///Title & SubTitle

              ///Buttons
            ],
          ),
        )));
  }
}
