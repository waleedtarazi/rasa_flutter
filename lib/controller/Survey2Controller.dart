// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:rasa_flutter/constant/constant.dart';

class Survey2Controller extends GetxController {
  RxString sym = ''.obs;
  var isloading = false.obs;
  //late Matrix4 sym;

  senddisorder(String disorder) async {
    try {
      isloading(true);
      Map data = {"answer": disorder};
      var body = json.encode(data);
      http.Response response = await http.post(
          Uri.parse(Local_BASE+DIAGNOSE+SYS),
          headers: {"Content-Type": "application/json"},
          body: body);
      if (response.statusCode == 200) {
        print(response.body);
        final data1 = utf8.decode(response.bodyBytes);
        print(data1);
        sym.value = data1;
        print('status code is:');
        print(response.statusCode);
        print('this is fetch symptoms - send disorder');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
