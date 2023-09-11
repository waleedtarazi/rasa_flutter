import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/view/global/navigation_bar.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/DoctorGuideController.dart';
import '../../model/doctor_guide_model.dart';
import 'DoctorRequestScreen.dart';


class DoctorGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DoctorGuideController controller = Get.put(DoctorGuideController());
    return Scaffold(
      backgroundColor: Color(0xFFF3F0FF),
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
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            Doctor doctor = controller.doctors[index];
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25.0), //<-- SEE HERE
                ),
                color: Color(0xFF3e2f87),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/dd.jpg'),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                doctor.phone,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //SizedBox(width: 16.0),

                      TextButton(
                        style: TextButton.styleFrom(
                          //padding: EdgeInsets.all(5),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                            backgroundColor: Colors.white24,
                            minimumSize:
                            Size(
                              MediaQuery.of(context).size.width * 0.05, // Replace Adaptive.w(5) with MediaQuery
                              MediaQuery.of(context).size.height * 0.02, // Replace Adaptive.h(2) with MediaQuery
                            )
                        ),
                        child: const Text(
                          'طلب الطبيب',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Get.to(DoctorRequestScreen(
                            name: doctor.name,
                            email: doctor.email,
                            phone: doctor.phone,
                            doctor_id: doctor.id,
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: UserNavigationBar(),
    );
  }
}
