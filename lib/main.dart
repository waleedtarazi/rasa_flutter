import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rasa_flutter/Screens/Login/login_screen.dart';
import 'package:rasa_flutter/Screens/Signup/signup_screen.dart';
import 'package:rasa_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:rasa_flutter/Screens/home_screen.dart';
import 'package:rasa_flutter/profile/themes.dart';
import 'package:rasa_flutter/profile/utils/user_preferences.dart';
import './screens/chat_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/sign_up.dart';
import 'Screens/profile_screen.dart';
import 'api/firebase_api.dart';
import 'constants.dart';
import 'controllers/profile_controller.dart';
import 'profile/page/profile_page.dart';
import 'services/auth.dart';

void main() async {
  Get.put(AuthService());
  Get.put(ProfileController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  final authService = AuthService();
  final isLoggedIn = await authService.isLoggedIn();
 runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  static final navigatorKey =  GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
     final user = UserPreferences.myUser;
    

    return ThemeProvider(
            initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //     primaryColor: kPrimaryColor,
        //     scaffoldBackgroundColor: Colors.white,
        //     elevatedButtonTheme: ElevatedButtonThemeData(
        //       style: ElevatedButton.styleFrom(
        //         elevation: 0, backgroundColor: kPrimaryColor,
        //         shape: const StadiumBorder(),
        //         maximumSize: const Size(double.infinity, 56),
        //         minimumSize: const Size(double.infinity, 56),
        //       ),
        //     ),
        //     inputDecorationTheme: const InputDecorationTheme(
        //       filled: true,
        //       fillColor: kPrimaryLightColor,
        //       iconColor: kPrimaryColor,
        //       prefixIconColor: kPrimaryColor,
        //       contentPadding: EdgeInsets.symmetric(
        //           horizontal: defaultPadding, vertical: defaultPadding),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //         borderSide: BorderSide.none,
        //       ),
        //     )
        //     ),
       theme: ThemeData.dark(),
        title: 'Rasa Chatbot',
        initialRoute: isLoggedIn ? '/home' : '/welcomev2',
        getPages: [
          // GetPage(name: '/login', page: () => LoginScreen()),
          // GetPage(name: '/signup', page: () => SignUpView()),
          GetPage(name: '/home', page: () => HomePage()),
         
          GetPage(name: '/login', page: () => const LoginScreenV2()),
          GetPage(name: '/welcomev2', page:()=> const WelcomeScreenV2()),
          GetPage(name: '/signup', page: () => const SignUpScreenV2()),
          
          GetPage(name: '/profile', page: () => ProfilePageV4()),
          // GetPage(name: '/chat', page: () => const ChatScreen())
          // Register the HomeScreen here
        ],
      ),

      ),
  
    );
  }
}
