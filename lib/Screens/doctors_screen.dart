import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';
import '../models/doctor.dart';

class DoctorListScreen extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

   DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() {
        if (doctorController.isLoading.value == false) {
          print(doctorController.isLoading.value);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (doctorController.doctorList.isEmpty) {
          return const Center(
            child: Text('No doctors found.'),
          );
        } else {
          return ListView.builder(
            itemCount: doctorController.doctorList.length,
            itemBuilder: (BuildContext context, int index) {
              final Doctor doctor = doctorController.doctorList[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        doctor.email,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        doctor.phone,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

    @override
  void onAppearing() {
    doctorController.fetchDoctors();
}

}
