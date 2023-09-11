import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/auth/auth-elements/signup-elements/age_field.dart';
import '/view/auth/auth-elements/signup-elements/living_location_field.dart';
import '/view/auth/auth-elements/signup-elements/phone_field.dart';
import '../../../../controller/auth_controller.dart';
import '/view/auth/auth-elements/signup-elements/password_conf.dart';
import '/view/auth/auth-elements/signup-elements/user_name.dart';
import '/view/Auth/Auth-elements/Password.dart';
import '/view/Auth/Auth-elements/email.dart';

class SignupFields extends StatefulWidget {
  const SignupFields({Key? key}) : super(key: key);

  @override
  State<SignupFields> createState() => _SignupFields();
}

class _SignupFields extends State<SignupFields> {
  @override


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => Column(
          children: [
            Row(children: [
              UserName(controller.nameController),
              AgeField(controller.ageController),
            ],),
            Row(children: [
              LivingLocationField(controller.living_locationController ),
              PhoneField(controller.phoneController),
            ],),
            Email('اكتب البريد الالكتروني', controller.emailController),
            // Email('اكتب البريد الالكتروني', TextEditingController(text: 'user@example.com')),
            Password(controller.passwordController),
            // Password(TextEditingController(text: 'string')),
            PassWordConf(controller.passwordConfController),

          ],
        ),
      ),
    );
  }
}
