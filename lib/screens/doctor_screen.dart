import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../models/doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _specialty;
  late bool _availability;
  late String _photoUrl;

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Doctor'),
                    content: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Specialty'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter specialty';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _specialty = value;
                                });
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Photo URL'),
                              onChanged: (value) {
                                setState(() {
                                  _photoUrl = value;
                                });
                              },
                            ),
                            SwitchListTile(
                              title: const Text('Availability'),
                              value: _availability,
                              onChanged: (bool value) {
                                setState(() {
                                  _availability = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final newDoctor = Doctor(
                              id: '', // Generate ID or use Firebase's auto ID
                              name: _name,
                              specialty: _specialty,
                              availability: _availability,
                              photoUrl: _photoUrl,
                            );
                            doctorProvider.addDoctor(newDoctor);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Add Doctor'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorProvider.doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctorProvider.doctors[index];
                return ListTile(
                  title: Text(doctor.name),
                  subtitle: Text(doctor.specialty),
                  onTap: () {
                    // Handle doctor tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
