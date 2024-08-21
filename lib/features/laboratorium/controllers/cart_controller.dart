import 'package:get/get.dart';
import 'package:t_store/features/laboratorium/models/cart_item_model.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/loaders/loaders.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      image: product.thumbnail,
      quantity: quantity,
    );
  }

  void addOneToCart(CartItemModel cartItem) {
    int index =
        cartItems.indexWhere((item) => item.productId == cartItem.productId);

    if (index >= 0) {
      cartItems[index].quantity += cartItem.quantity;
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Barang Telah ditambahkan ke keranjang');
  }

  // Update Cart values
  void updateCart() {
    _updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void _updateCartTotals() {
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedNoOfItems += item.quantity;
      // Assume price is stored and calculated here
      // calculatedTotalPrice += item.quantity * item.price;
    }

    noOfCartItems.value = calculatedNoOfItems;
  }

  // Save cart items to persistent storage
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage().saveData('cartItems', cartItemStrings);
  }

  // Load cart items from persistent storage
  void loadCartItems() {
    final cartItemStrings =
        TLocalStorage().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList());
      _updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    return cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
  }

  void clearCart() {
    cartItems.clear();
    updateCart();
  }
}
