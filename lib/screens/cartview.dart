import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cartcontroller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Cart is empty'));
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartController.cartItems[index];
              return ListTile(
                title: Text(cartItem.product.name),
                subtitle: Text('Quantity: ${cartItem.quantity}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () =>
                          cartController.removeFromCart(cartItem.product),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () =>
                          cartController.addToCart(cartItem.product),
                    ),
                    Text('\$${cartItem.product.year * cartItem.quantity}'),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
