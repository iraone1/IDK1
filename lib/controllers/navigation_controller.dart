import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable variable

  void changeIndex(int index) {
    selectedIndex.value = index; // Update the index
  }
}
