import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/features/laboratorium/models/banner_model.dart';
import 'package:t_store/routes/routes.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
  ];

  // /// User
  // static final UserModel user = UserModel(
  //     firstName: 'Coding', lastName: 'with T', email: 'aaaaallaamm@gmail.com');

  // /// Cart
  // static final CartModel cart =
  //     CartModel(cartId = '001', items: [CartItemModel()]);

  // /// Order
  // static final List<OrderModel> orders =
}
