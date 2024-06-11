import 'package:flutter/material.dart';
import '../models/patient.dart';
import '../services/firestore_service.dart';

class PatientProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Patient> _patients = [];

  List<Patient> get patients => _patients;

  PatientProvider() {
    _firestoreService.getPatients().listen((patients) {
      _patients = patients;
      notifyListeners();
    });
  }

  Future<void> addPatient(Patient patient) async {
    await _firestoreService.addPatient(patient);
  }

  Future<void> updatePatient(Patient patient) async {
    await _firestoreService.updatePatient(patient);
  }

  Future<void> deletePatient(String id) async {
    await _firestoreService.deletePatient(id);
  }
}
