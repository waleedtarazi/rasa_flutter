import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants_auth.dart';
import '../models/user.dart';


class AuthService extends GetxService {
 Future<User?> login(String email, String password) async {
  final dio = Dio();
  final url = logInAPI;
  final data = {
    "email": email,
    "password": password
  };
  try {
    final response = await dio.post(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
          ),
         data: data);
    print('Response status code is :${response.statusCode}\n\n');
    if (response.statusCode == 200) {
      final data = response.data;
      var userToken = data['access_token'];
      var profile = data['user'];
      final user = User(name: profile['name'] ?? 'User', age:profile['age']?? 0 , email: profile['email'], token: userToken);
      print('status should be  200');
      // Save the user data to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user.toJson()));
      prefs.setString('access_token', userToken);

      return user;
    } else {
      // Check if the response body is null
      print('status should not be 200 here');
      final errorBody = response.data != null ? response.data : null;
      final errorMessage = errorBody != null ? errorBody['message'] : 'Failed to login';
      throw Exception(errorMessage ?? 'Failed to login');
    }
  } catch (e) {
    throw Exception('Failed to login');
  }
}
  Future<User?> register(String email, String password, String confirmPassword) async{
  final dio = Dio();
  final url = 'https://mood-bot.onrender.com/user/signup';
  final data = {
  "name": "Hanan",
  "age": 30,
  "email": "hanan@gmail.com",
  "password": "hanan",
  "confirm_password": "hanan"
};

  try {
    final response = await dio.post(url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
          ),
         data: data);
    print('Response status code is :${response.statusCode}\n\n');
    if (response.statusCode == 200) {
      final data = response.data;
      var userToken = data['access_token'];
      var profile = data['profile'];
      final user = User(name: profile['name']?? 'User', 
      age:profile['age'] ?? 20, 
      email: profile['email'], 
      token: userToken);

      print('status should be  200');
      // Save the user data to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user.toJson()));
      prefs.setString('access_token', userToken);

      return user;
    } else {
      if (response.statusCode != 200){
        print(response.data);
      }
      // Check if the response body is null
      print('status should not be 200 here');
      final errorBody = response.data != null ? response.data : null;
      final errorMessage = errorBody != null ? errorBody['message'] : 'Failed to login';
      throw Exception(errorMessage ?? 'Failed to login');
    }
  } catch (e) {
    throw Exception('Failed to login');
  }
}

Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final userJson = prefs.getString('user');
    return token != null && userJson != null;
  }


Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.remove('access_token');
  }

}