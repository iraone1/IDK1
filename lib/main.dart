import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello/controllers/navigation_controller.dart'; // Import the controller
import 'package:hello/screens/cartview.dart';
import 'package:hello/screens/product_screen.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[500],
      ),
    );
  }
}

class Home extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => Center(
            child: _widgetOptions
                .elementAt(navigationController.selectedIndex.value),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: navigationController.selectedIndex.value,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: navigationController.changeIndex, // Call the changeIndex method
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

List<Widget> _widgetOptions = <Widget>[
  Text('Home Page'),
  CartScreen(),
  ProductScreen(),
  UserView(),
];
