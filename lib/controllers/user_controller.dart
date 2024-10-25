import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var users = data['data'] as List;
        userList.value = users.map((user) => User.fromJson(user)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
