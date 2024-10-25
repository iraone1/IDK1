import 'package:get/get.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != 1) {
      // Only proceed if the product is found
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    } else {}
  }
}
