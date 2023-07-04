import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasa_flutter/controllers/login_controller.dart';


class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}