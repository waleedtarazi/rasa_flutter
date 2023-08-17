import 'package:get/get.dart';
import '../models/doctor.dart';
import '../services/doctor_services.dart';

class DoctorController extends GetxController {
  // final _doctors = <Doctor>[].obs;
  
  RxList<Doctor> doctorList = RxList<Doctor>([]);
  RxBool isLoading = RxBool(false);

  // List<Doctor> get doctors => _doctors.toList();

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
  final doctorService = DoctorService(); // Create an instance of DoctorService
  isLoading.value = true;
  final doctors = await doctorService.getDoctors(); // Call the getDoctors method on the instance
  doctorList.assignAll(doctors);
}
  void addDoctor(Doctor doctor) {
    doctorList.add(doctor);
  }

  @override
  void onReady() {
    super.onReady();
    doctorList.listen((_) {
      update();
    });
  }
}