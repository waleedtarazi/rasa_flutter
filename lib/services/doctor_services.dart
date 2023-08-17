import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rasa_flutter/constants_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/doctor.dart';

class DoctorService extends GetxService {
  Future<List<Doctor>> getDoctors() async {
    final dio = Dio();
    const url = allDoctorsAPI; // Replace with your API endpoint

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response status code is: ${response.statusCode}\n\n');

      if (response.statusCode == 200) {
        final jsonData = response.data as List<dynamic>;
        final List<Doctor> doctors = [];

        for (var jsonDoctor in jsonData) {
          doctors.add(Doctor.fromJson(jsonDoctor));
        }

        return doctors;
      } else {
        // Check if the response body is null
        final errorBody = response.data != null ? response.data : null;
        final errorMessage = errorBody != null ? errorBody['message'] : 'Failed to load doctors';
        throw Exception(errorMessage ?? 'Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Failed to load doctors');
    }
  }
}