import 'package:flutter/material.dart';
import 'package:rasa_flutter/view/global/app_bar.dart';
import 'package:rasa_flutter/view/settings/signout_button.dart';

import '../global/navigation_bar.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //UserAppBar(),
          SizedBox(height: 100,),
          SignOutButton(),

        ],
      ),
      bottomNavigationBar: UserNavigationBar(),
    );
  }
}
