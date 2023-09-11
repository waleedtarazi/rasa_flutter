// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/Survey2Controller.dart';
import '../doctors/doctor_guide_screen.dart';
import '../home_page/home_page.dart';



class SurveyScreen2 extends StatelessWidget {
  final String ViewString;
  const SurveyScreen2({super.key, required this.ViewString});

  @override
  Widget build(BuildContext context) {
    Survey2Controller _survey2Controller = Get.put(Survey2Controller());
    _survey2Controller.senddisorder(ViewString);
    return Scaffold(
        backgroundColor: Color(0xFFF3F0FF),
        appBar: AppBar(
          backgroundColor: Color(0xFF3e2f87),
          title: Center(
            child: const Text(
              'بسيطة',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Center(
          child: Obx(
            () => _survey2Controller.isloading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3, // Replace Adaptive.w(5) with MediaQuery
                         height:  MediaQuery.of(context).size.height * 0.1, // Replace Adaptive.h(2) with MediaQuery,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                          width: 700,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        ViewString.substring(1, ViewString.length - 1),
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'أعراض هذا المرض:',
                        style: const TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _survey2Controller.sym.toString() == 'null' ? 'لاشيء' :
                        _survey2Controller.sym.toString().substring(
                            1, _survey2Controller.sym.toString().length - 1),
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            backgroundColor: Color(0xFF3e2f87),
                            minimumSize:  Size(
                              MediaQuery.of(context).size.width * 0.2, // Replace Adaptive.w(5) with MediaQuery
                              MediaQuery.of(context).size.height * 0.08, // Rep
                            )),
                        child: const Text(
                          'متابعة',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Get.to(HomePage());
                        },
                      ),
                    ],
                  ),
          ),
        ));
  }
}
