import 'package:flutter/material.dart';

import 'package:get/get.dart';
// ignore: unused_import

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/DoctorGuideController.dart';

class DoctorRequestScreen extends StatelessWidget {
  final String name, phone, email;
  final int doctor_id;
  const DoctorRequestScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.doctor_id});

  @override
  Widget build(BuildContext context) {
    TextEditingController des = TextEditingController();
    DoctorGuideController controller = Get.put(DoctorGuideController());
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3e2f87),
        title: const Center(
          child: Text(
            'بسيطة',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/images/210.jpg'),
            ),
            Text(
              this.name,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFF7062b0),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  this.phone,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                title: Text(
                  this.email,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextField(
                controller: des,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'الرجاء سرد ما تشعر به للطبيب',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  backgroundColor: const Color(0xFF7062b0),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.05, // Replace Adaptive.w(5) with MediaQuery
                    MediaQuery.of(context).size.height * 0.02, // Replace Adaptive.h(2) with MediaQuery
                  ),),
              child: const Text(
                'طلب الطبيب',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
              String s = des.text;
              print(s);
                controller.requestdoctor(doctor_id, s);
              },
            ),
          ],
        ),
      ),
    );
  }
}
