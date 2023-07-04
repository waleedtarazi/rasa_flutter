import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxInt age = 0.obs;
  RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      final user = jsonDecode(userJson);
      name.value = user['name'] ?? '';
      age.value = user['age'] ?? 0;
      email.value = user['email'] ?? '';
    }
    update();
  }

  void saveUserProfile() {}
}

