import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../controllers/cartcontroller.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.productList.isEmpty) {
          return Center(child: Text('No products found'));
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return Card(
                child: ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.year}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cartController.addToCart(product);
                      print(
                          'Add to cart button pressed for ${product.name}'); // Debug log
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
