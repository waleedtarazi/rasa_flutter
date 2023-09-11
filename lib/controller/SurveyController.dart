import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../view/personalitytest/SurveyScreen2.dart';

class SurveyController extends GetxController {
  RxString res = ''.obs;

  var isloading = false.obs;
  var count = 2;
  var one = 1;
  String api = 'answer';
  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  fetchdata() async {
    try {
      isloading(true);
      http.Response response =
          await http.get(Uri.parse(Local_BASE+DIAGNOSE+'$api$one'));

      if (response.statusCode == 200) {
        print('status code is:');
        print(response.statusCode);
        print('this is fetch data');
        print(utf8.decode(response.bodyBytes));
        res.value = utf8.decode(response.bodyBytes);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }

  senddata(String answer) async {
    try {
      isloading(true);
      var url = Local_BASE+DIAGNOSE+'$api$count';
      Map data = {"answer": answer};
      var body = json.encode(data);
      var response = await http.post((Uri.parse(url)),
          headers: {"Content-Type": "application/json"}, body: body);
      print("${response.statusCode}");
      res.value = utf8.decode(response.bodyBytes);
      print(res.value);
      print(res.value.substring(0, 2));
      if (res.value.substring(0, 2) == '"ي') {
        Get.to(SurveyScreen2(ViewString: res.value));
      } else if (res.value == '"على ما يبدو انك تعاني من اضطرابات الصدمة"') {
        api = 'PSTD';
        count = 1;
        this.fetchdata();
      } else if (res.value == '"على ما يبدو انك تعاني من اضطرابات قلق"') {
        count = 1;
        api = 'Anxiety';
        this.fetchdata();
      } else if (res.value == '"على ما يبدو انك تعاني من اضطرابات مزاج"') {
        api = 'Mood';
        count = 1;
        this.fetchdata();
      } else if (res.value == '"على ما يبدو انك تعاني من اضطرابات طعام"') {
        api = 'Eating';
        count = 1;
        this.fetchdata();
      } else if (res.value == '"على ما يبدو انك تعاني من اضطرابات شخصية"') {
        api = 'PD';
        count = 1;
        this.fetchdata();
      }
      count += 1;
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
