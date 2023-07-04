import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rasa_flutter/services/auth.dart';
// import 'package:toast/toast.dart' as t;

import '../Screens/home_screen.dart';

class LoginController extends GetxController {
  final authService = Get.find<AuthService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      final user = await authService.login(emailController.text, passwordController.text);
      print(user);
            if (user != null) {
        Get.off(HomePage());
      }
    } on HttpException catch (e) {
      // Handle specific error
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      // Handle other errors
      Fluttertoast.showToast(
        msg: 'Error: $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}