import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:rasa_flutter/constant/constant.dart';

import '../model/MyRequestsModel.dart';

class MyRequestsController extends GetxController {
  var requests = <Requestt>[].obs;
  var isloading = false.obs;
  final _storage = FlutterSecureStorage();
  Future<String> get token async {
    return await _storage.read(key: 'token') ?? '';
   // return token;
  }
  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  fetchdata() async {
    String token = await this.token;
    try {
      isloading(true);
      Map<String, String> headers = {
        'accept': 'application/json',
        'user-token':"$token",
      };
      http.Response response = await http.get(Uri.parse(
          Local_BASE+USER+REQUESTS),headers: headers);

      if (response.statusCode == 200) {
        print('status code is:');
        print(response.statusCode);
        //print(utf8.decode(response.bodyBytes));
        final resbodybytes = utf8.decode(response.bodyBytes);
        final data = json.decode(resbodybytes)as List<dynamic>;
        print('sadfsa0');
        requests.assignAll(data.map((json) => Requestt(
              json['request_id'] as int,
              json['date'] as String,
              json['user_name'] as String,
              json['doctor_name'] as String,
              json['status'] as String,
              json['description'] as String,
            )));
      } else {
        final resbodybytes = utf8.decode(response.bodyBytes);
        print(resbodybytes);
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
