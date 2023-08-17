import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class UserProfileModel extends GetxController {
  String _name = '';
  String _email = '';
  int _age = 0;
  String _phone= '';
  String _living_location = '';
  final _storage = FlutterSecureStorage();

  Future<String> get token async {
    return await _storage.read(key: 'token') ?? '';

  }

  String get name => _name;

  String get email => _email;

  int get age => _age;
  String get phone => _phone;

  String get living_location => _living_location;

  Future<void> fetchUserProfile() async {
    print("pageprofile11111111111111111111111111111111");
    String token = await this.token;
    print("profillllllle  token" + token);
    if (token.isNotEmpty) {
      print("yessssssssssssssssssssssssssss" );
      // Make API call to get user profile data
      // Replace with your own API endpoint and logic
      Uri url = Uri.parse('https://mood-bot.onrender.com/user/profile');
      print("whats wrong");
      Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "user-token": "$token",
      };

      try {
        print(token);
        print("hello" );
        http.Response response = await http.get(url, headers: headers);
        print("responssss"+response.body);
        if (response.statusCode == 200) {
          print("edit " );
          String responseBody = utf8.decode(response.bodyBytes);
          Map<String, dynamic> data = json.decode(responseBody);
          print(data);
          _name = data['name'];
          _email = data['email'];
          _age = data['age'];
          _phone = data['phone'];
          _living_location = data['living_location'];
          await _storage.write(key: 'name', value: _name);
          await _storage.write(key: 'email', value: _email);
          await _storage.write(key: 'age', value: _age.toString());
          await _storage.write(key: 'phone', value: _phone);
          await _storage.write(key: 'living_location', value: _living_location);
          print(data);
          update();

        }
      } catch (error) {
        print(error);
      }
    }
  }

  Future<void> readUserProfile() async {
    _name = await _storage.read(key: 'name') ?? '';
    _email = await _storage.read(key: 'email') ?? '';
    String ageString = await _storage.read(key: 'age') ?? '';
    _age = int.tryParse(ageString) ?? 0;
    _phone = await _storage.read(key: 'phone') ?? '';
    _living_location = await _storage.read(key: 'living_location') ?? '';
    print(await _storage.readAll());
    update();
  }


  Future<bool> editProfile(String newName, int newAge,String newphone,String newliving_location , String currentPassword, String newPassword, String confirmNewPassword) async {
    String token = await this.token;

    if (token.isNotEmpty) {
      Uri url = Uri.parse('https://mood-bot.onrender.com/user/profile');

      Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "user-token": "$token",
      };


      print(newName+newliving_location+newphone);

      Map<String, dynamic> body = {
      };
      if (newName.isNotEmpty) {
    body['name'] = newName;
  }
  if (newAge != null) {
    body['age'] = newAge.toString();
  }
  if (newphone.isNotEmpty) {
    body['phone'] = newphone;
  }
  if (newliving_location.isNotEmpty) {
    body['living_location'] = newliving_location;
  }
  if (currentPassword.isNotEmpty) {
    body['current_password'] = currentPassword;
  }
  if (newPassword.isNotEmpty) {
    body['new_password'] = newPassword;
  }
  if (confirmNewPassword.isNotEmpty) {
    body['confirm_new_password'] = confirmNewPassword;
  }


      try {
        print(body);
        print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww1111111111111111111111111111111");
        http.Response response = await http.put(url, headers: headers, body: json.encode(body));
        print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
        if (response.statusCode == 200) {
          print(response);
         if (newName.isNotEmpty) {
        _name = newName;
        await _storage.write(key: 'name', value: _name);
      }
      if (newAge != null) {
        _age = newAge;
        await _storage.write(key: 'age', value: _age.toString());
      }
      if (newliving_location.isNotEmpty) {
        _living_location = newliving_location;
        await _storage.write(key: 'living_location', value: _living_location);
      }
      if (newphone.isNotEmpty) {
        _phone = newphone;
        await _storage.write(key: 'phone', value: _phone);
      }

      update();
      return true;
    }
      } catch (error) {
        print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
        print(error);
      }
    }

    return false;
  }
}