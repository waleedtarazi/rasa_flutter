import 'dart:convert';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rasa_flutter/constant/constant.dart';

import '../model/doctor_guide_model.dart';
 import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DoctorGuideController extends GetxController {
  var doctors = <Doctor>[].obs;
  var isloading = false.obs;
   final _storage = FlutterSecureStorage();
  Future<String> get token async {
     return await _storage.read(key: 'token') ?? '';
    //return token;
  }

  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  fetchdata() async {
    try {
      isloading(true);
      http.Response response = await http.get(Uri.parse(
          Local_BASE+DASHBOARD+DOCTORS));
      if (response.statusCode == 200) {
        print('status code is:');
        print(response.statusCode);
        print(utf8.decode(response.bodyBytes));
        String responseBody = utf8.decode(response.bodyBytes);
        final data = json.decode(responseBody)as List<dynamic>;
        //final data = jsonDecode(response.body) as List<dynamic>;
        // final data = utf8.decode(response.bodyBytes) as List<dynamic>;
        doctors.assignAll(data.map((json) => Doctor(
              json['name'] as String,
              json['phone'] as String,
              json['email'] as String,
              json['id'] as int,
            )));
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }

  requestdoctor(int docid, String des) async {
    String token = await this.token;
    try {

      isloading(true);
      var url = Local_BASE+USER+REQUEST_DOCTOR;
      var doctorid = docid;
      print(doctorid);
      var queryparameters = {
        'doctor_id': doctorid.toString(),
        'desctiption': des
      };
      Map<String, String> headers = {
        'accept': 'application/json',
        'user-token':"$token",
      };
      print(token);
      var uri = Uri.parse(url).replace(queryParameters: queryparameters);
      var response = await http.post(uri, headers: headers);
      print("${response.statusCode}");
      print(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
