import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../providers/appointment_provider.dart';
import '../providers/patient_provider.dart';
import 'doctor_screen.dart';
import 'appointment_screen.dart';
import 'patient_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final doctorProvider = Provider.of<DoctorProvider>(context);
    // ignore: unused_local_variable
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    // ignore: unused_local_variable
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Management'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorScreen()),
                );
              },
              child: const Text('Doctors'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppointmentScreen()),
                );
              },
              child: const Text('Appointments'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientScreen()),
                );
              },
              child: const Text('Patients'),
            ),
          ],
        ),
      ),
    );
  }
}
