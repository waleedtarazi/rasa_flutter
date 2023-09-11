import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:rasa_flutter/view/get_start/two_page/two_page.dart';
import 'package:rasa_flutter/view/home_page/home_page.dart';
import 'api/firebase_api.dart';
import 'controller/user_profile_model.dart';



void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  // fire base
  await Firebase.initializeApp();
  String? fcm_token = await FirebaseApi().initNotification();
  // Create a new instance of FlutterSecureStorage
  const storage = FlutterSecureStorage();
  UserProfileModel userProfileModel = Get.put(UserProfileModel());
  await userProfileModel.readUserProfile();
  // Read the access token from secure storage
  await storage.write(key: 'FCM', value: fcm_token);
  String? temp = await storage.read(key: 'FCM');
  print('the fcm token in the main'+ '$temp');
  final token = await storage.read(key: 'token');
  
  Get.put(HomeController());

  runApp( MyApp(token: token, fcm_token: fcm_token));
}

class MyApp extends StatelessWidget {
  final String? token;
  final String? fcm_token;
  const MyApp({Key? key, this.token, this.fcm_token}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserProfileModel userProfileModel = Get.find();
    String name = userProfileModel.name;
    String email = userProfileModel.email;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      home:token != null ? const HomePage() : const TwoPage(),
    );

  }
}
class HomeController extends GetxController {
  final FlutterSecureStorage storage = Get.put(FlutterSecureStorage());
  final RxBool isLoggedIn = false.obs;
  
  Future<void> logout() async {
    // Remove the access token from secure storage
    await storage.delete(key: 'token');
    await storage.delete(key: 'name');
    await storage.delete(key: 'phone');
    await storage.delete(key: 'age');
    await storage.delete(key: 'email');
    // Set isLoggedIn to false
    isLoggedIn.value = false;

    // Navigate to the login screen
    Get.offAll(() => const TwoPage());
  }

}

