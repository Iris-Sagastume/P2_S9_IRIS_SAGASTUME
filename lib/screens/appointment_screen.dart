import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../providers/patient_provider.dart';
import '../providers/appointment_provider.dart';
import '../models/doctor.dart';
import '../models/patient.dart';
import '../models/appointment.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late Doctor? _selectedDoctor;
  late Patient? _selectedPatient;
  late DateTime _selectedDateTime = DateTime.now();
  late String _photoUrl = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final patientProvider = Provider.of<PatientProvider>(context);
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<Doctor>(
                value: _selectedDoctor,
                onChanged: (Doctor? value) {
                  setState(() {
                    _selectedDoctor = value!;
                  });
                },
                items: doctorProvider.doctors.map((Doctor doctor) {
                  return DropdownMenuItem<Doctor>(
                    value: doctor,
                    child: Text(doctor.name),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Select Doctor'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a doctor';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<Patient>(
                value: _selectedPatient,
                onChanged: (Patient? value) {
                  setState(() {
                    _selectedPatient = value!;
                  });
                },
                items: patientProvider.patients.map((Patient patient) {
                  return DropdownMenuItem<Patient>(
                    value: patient,
                    child: Text(patient.name),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Select Patient'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a patient';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Appointment Date and Time'),
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDateTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      // ignore: use_build_context_synchronously
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select appointment date and time';
                  }
                  return null;
                },
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDateTime.toString(),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Photo URL'),
                onChanged: (value) {
                  setState(() {
                    _photoUrl = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter photo URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save appointment to Firestore
                    final newAppointment = Appointment(
                      id: '', // Generate ID or use Firebase's auto ID
                      doctorId: _selectedDoctor!.id,
                      patientId: _selectedPatient!.id,
                      appointmentTime: _selectedDateTime,
                      photoUrl: _photoUrl,
                    );
                    appointmentProvider.addAppointment(newAppointment);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
