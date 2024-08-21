import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/laboratorium/models/banner_model.dart';
import 'package:t_store/utils/loaders/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;

  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners(); // Memanggil fetchBanners saat inisialisasi
    super.onInit();
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      // Code to fetch data from Firestore
      final bannerRepo = Get.put(BannerRepository());
      final fetchedBanners = await bannerRepo.fetchBanners();

      // Tambahkan perintah print di sini untuk debugging
      print(
          "Fetched banners: ${fetchedBanners.map((e) => e.imageUrl).toList()}");

      banners.assignAll(fetchedBanners);
    } catch (e) {
      // Tangani kesalahan dan tampilkan pesan kesalahan kepada pengguna
      print("Firebase error: $e"); // Tambahkan log untuk melihat kesalahan
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false; // Pastikan indikator loading diatur kembali
    }
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
