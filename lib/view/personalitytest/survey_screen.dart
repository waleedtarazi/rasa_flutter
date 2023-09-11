// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
// ignore: unused_import
import '../../controller/SurveyController.dart';
import 'SurveyScreen2.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SurveyController _surveyController = Get.put(SurveyController());
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
            () => _surveyController.isloading.value
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
                        'أنا لطيف مجيبك الآلي الخاص',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'أود سؤالك بعض الأسئلة قبل أن نبدأ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 80),
                      Text(
                        _surveyController.res.toString(),
                            // .substring(
                            // 1, _surveyController.res.toString().length - 1),
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                            ),
                            backgroundColor: Color(0xFF3e2f87),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.16, // Replace Adaptive.w(5) with MediaQuery
                              MediaQuery.of(context).size.height * 0.09, // Replace Adaptive.h(2) with MediaQuery
                            )),
                        child: const Text(
                          'نعم',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          _surveyController.senddata('نعم');
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          backgroundColor: Color(0xFF3e2f87),
                          minimumSize:Size(
                            MediaQuery.of(context).size.width * 0.16, // Replace Adaptive.w(5) with MediaQuery
                            MediaQuery.of(context).size.height * 0.09, // Replace Adaptive.h(2) with MediaQuery
                          ),
                        ),
                        child: const Text(
                          'لا',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          _surveyController.senddata('لا');
                          //Get.to(SurveyScreen2(ViewString: 'sfd'));
                        },
                      ),],
                      )
                      
                    ],
                  ),
          ),
        ));
  }
}
