import 'package:get/get.dart';
import 'package:t_store/features/laboratorium/models/cart_item_model.dart';
import 'package:t_store/features/laboratorium/models/product_model.dart';
import 'package:t_store/utils/loaders/loaders.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItems();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    final cartItem = cartItems.firstWhere(
      (item) => item.productId == product.id,
      orElse: () => CartItemModel.empty(),
    );
    productQuantityInCart.value = cartItem.quantity;
  }

  // Method to convert ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      image: product.thumbnail,
      quantity: quantity,
    );
  }

  // Add items to the cart
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }

    if (product.stock < 1) {
      TLoaders.warningSnackBar(message: 'Barang Kosong', title: 'Oh Snap!');
      return;
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      cartItems[index].quantity += selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Barang Telah ditambahkan ke keranjang');
  }

  // Add one item to the cart
  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  // Remove one item from the cart
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems.removeAt(index);
      }

      updateCart();
    }
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
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);

    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
