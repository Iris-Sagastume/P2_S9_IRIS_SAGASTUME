import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor.dart';
import '../models/appointment.dart';
import '../models/patient.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Doctor CRUD operations
  Stream<List<Doctor>> getDoctors() {
    return _db.collection('doctors').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Doctor.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addDoctor(Doctor doctor) {
    return _db.collection('doctors').add(doctor.toMap());
  }

  Future<void> updateDoctor(Doctor doctor) {
    return _db.collection('doctors').doc(doctor.id).update(doctor.toMap());
  }

  Future<void> deleteDoctor(String id) {
    return _db.collection('doctors').doc(id).delete();
  }

  // Appointment CRUD operations
  Stream<List<Appointment>> getAppointments() {
    return _db.collection('appointments').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Appointment.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addAppointment(Appointment appointment) {
    return _db.collection('appointments').add(appointment.toMap());
  }

  Future<void> updateAppointment(Appointment appointment) {
    return _db.collection('appointments').doc(appointment.id).update(appointment.toMap());
  }

  Future<void> deleteAppointment(String id) {
    return _db.collection('appointments').doc(id).delete();
  }

  // Patient CRUD operations
  Stream<List<Patient>> getPatients() {
    return _db.collection('patients').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Patient.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> addPatient(Patient patient) {
    return _db.collection('patients').add(patient.toMap());
  }

  Future<void> updatePatient(Patient patient) {
    return _db.collection('patients').doc(patient.id).update(patient.toMap());
  }

  Future<void> deletePatient(String id) {
    return _db.collection('patients').doc(id).delete();
  }
}
