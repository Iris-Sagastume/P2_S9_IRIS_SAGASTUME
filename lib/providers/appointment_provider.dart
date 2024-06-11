import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../services/firestore_service.dart';

class AppointmentProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;

  AppointmentProvider() {
    _firestoreService.getAppointments().listen((appointments) {
      _appointments = appointments;
      notifyListeners();
    });
  }

  Future<void> addAppointment(Appointment appointment) async {
    await _firestoreService.addAppointment(appointment);
  }

  Future<void> updateAppointment(Appointment appointment) async {
    await _firestoreService.updateAppointment(appointment);
  }

  Future<void> deleteAppointment(String id) async {
    await _firestoreService.deleteAppointment(id);
  }
}
