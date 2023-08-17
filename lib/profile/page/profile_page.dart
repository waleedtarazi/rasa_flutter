import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';
import '../model/user_v4.dart';
import '../page/edit_profile_page.dart';
import '../utils/user_preferences.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';

class ProfilePageV4 extends StatefulWidget {
  const ProfilePageV4({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageV4State createState() => _ProfilePageV4State();
}

class _ProfilePageV4State extends State<ProfilePageV4> {

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePageV4()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(),
              const SizedBox(height: 24),
              // Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              // NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName( ) => Column(
        children: [
          Text(
            controller.name.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            controller.email.toString(),
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(UserV4 user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
