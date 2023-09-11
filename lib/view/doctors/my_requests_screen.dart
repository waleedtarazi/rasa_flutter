// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:http/http.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/MyRequestsController.dart';
import '../../model/MyRequestsModel.dart';

class MyRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyRequestsController controller = Get.put(MyRequestsController());
    return Scaffold(
      //backgroundColor: Color(0xFFF3F0FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF3e2f87),
        title: Center(
          child: Text(
            'بسيطة',
          ),
        ),
      ),
      body: Obx(
            () => controller.isloading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.requests.length,
          itemBuilder: (context, index) {
            Requestt request = controller.requests[index];
            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25.0), //<-- SEE HERE
                ),
                color: Color(0xFFF3F0FF),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                            AssetImage('assets/images/dd.jpg'),
                          ),

                      SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            request.doctor_name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3e2f87)),
                          ),



                          SizedBox(height: 10.0),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              request.description,  
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3e2f87)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                        ],
                      ),
                      SizedBox(width: 50.0),

                      Text(
                        request.status,
                        style: TextStyle(
                            color: request.status == 'accepted'
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      //bottomNavigationBar: UserNavigationBar(),
    );
  }
}
