// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../providers/appointment_provider.dart';
import '../providers/patient_provider.dart';
import 'doctor_screen.dart';
import 'appointment_screen.dart';
import 'patient_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DoctorScreen(),
    AppointmentScreen(),
    PatientScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        title: const Text('Clinica'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Cita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Paciente',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
