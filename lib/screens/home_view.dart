import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_screen.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(UserView());
          },
          child: Text('Go to User Page'),
        ),
      ),
    );
  }
}
