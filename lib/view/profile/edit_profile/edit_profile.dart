import 'package:flutter/material.dart';
import 'package:rasa_flutter/controller/user_profile_model.dart';
import 'package:rasa_flutter/view/global/app_bar.dart';
import 'package:rasa_flutter/view/profile/edit_profile/elements_edit_profile/change_information.dart';
import 'package:get/get.dart';
import '../../global/navigation_bar.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(height: 25),
            ChangeInformation(),

          ],
        ),
      ),
      //bottomNavigationBar: UserNavigationBar(),
    );

  }
}
