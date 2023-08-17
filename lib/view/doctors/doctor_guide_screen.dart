import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/DoctorGuideController.dart';
import '../../model/doctor_guide_model.dart';
import '../global/navigation_bar.dart';



class DoctorGuideScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    DoctorGuideController controller = Get.put(DoctorGuideController());
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
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            Doctor doctor = controller.doctors[index];
            return Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(25.0), //<-- SEE HERE
                ),
                color: Color(0xFFF3F0FF),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/dd.jpg'),
                      ),
                      SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3e2f87)),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            doctor.phone,
                            style: TextStyle(color: Color(0xFF3e2f87)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child:TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust the padding values as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Color(0xFF3e2f87),
                          ),
                          onPressed: () {
                            // Your onPressed logic here
                          },
                          child: Text(
                            'طلب الطبيب',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
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
