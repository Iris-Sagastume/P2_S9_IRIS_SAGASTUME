import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  String id;
  String doctorId;
  String patientId;
  DateTime appointmentTime;

  Appointment({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.appointmentTime, required String photoUrl,
  });

  factory Appointment.fromMap(Map<String, dynamic> data, String id) {
    return Appointment(
      id: id,
      doctorId: data['doctorId'] ?? '',
      patientId: data['patientId'] ?? '',
      appointmentTime: (data['appointmentTime'] as Timestamp).toDate(), photoUrl: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'patientId': patientId,
      'appointmentTime': appointmentTime,
    };
  }
}
