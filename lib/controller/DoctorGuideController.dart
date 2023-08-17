import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/doctor_guide_model.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DoctorGuideController extends GetxController {
  var doctors = <Doctor>[].obs;
  var isloading = false.obs;
  // final _storage = FlutterSecureStorage();
  Future<String> get token async {
    // return await _storage.read(key: 'token') ?? '';
    return token;
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
          'https://mood-bot.onrender.com/dashboard/doctors?skip=0&limit=100'));

      if (response.statusCode == 200) {
        print('status code is:');
        print(response.statusCode);
        print(utf8.decode(response.bodyBytes));
        final data = jsonDecode(response.body) as List<dynamic>;
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

  requestdoctor(int docid) async {
    try {
      //String token = await this.token;
      //print(token);
      isloading(true);
      var url = 'https://mood-bot.onrender.com/user/request_doctor';
      var doctorid = docid;
      var queryparameters = {'doctor_id': doctorid.toString()};
      Map<String, String> headers = {
        'accept': 'application/json',
        'user_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImV4cCI6MTY5MTU4OTcxMS4yODcxNjk1fQ.iLHHfeNceWz0fIyacto_K_kjrOJ5YpM4nGMouFcS5Ns',
      };
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
