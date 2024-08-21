import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/laboratorium/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Fetch Banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();

      final banners =
          result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();

      // Tambahkan perintah print di sini untuk debugging
      print("Fetched banners: ${banners.map((e) => e.imageUrl).toList()}");

      return banners;
    } catch (e) {
      // Tangani kesalahan dan tampilkan pesan kesalahan kepada pengguna
      print("Firebase error: $e"); // Tambahkan log untuk melihat kesalahan
      throw 'Something went wrong, Please try again'; // Buang kesalahan ke Controller
    }
  }
}
