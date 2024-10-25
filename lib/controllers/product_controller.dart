import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var cartList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('https://reqres.in/api/products'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var products = data['data'] as List;
        productList.value =
            products.map((product) => Product.fromJson(product)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch products");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching products");
    } finally {
      isLoading(false);
    }
  }

  void addToCart(Product product) {
    cartList.add(product);
    Get.snackbar("Added to Cart", "${product.name} has been added to the cart");
  }
}
