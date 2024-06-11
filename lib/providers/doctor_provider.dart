import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../services/firestore_service.dart';

class DoctorProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Doctor> _doctors = [];

  List<Doctor> get doctors => _doctors;

  DoctorProvider() {
    _firestoreService.getDoctors().listen((doctors) {
      _doctors = doctors;
      notifyListeners();
    });
  }

  Future<void> addDoctor(Doctor doctor) async {
    await _firestoreService.addDoctor(doctor);
  }

  Future<void> updateDoctor(Doctor doctor) async {
    await _firestoreService.updateDoctor(doctor);
  }

  Future<void> deleteDoctor(String id) async {
    await _firestoreService.deleteDoctor(id);
  }
}
