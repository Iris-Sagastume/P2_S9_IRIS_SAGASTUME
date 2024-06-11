// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patient_provider.dart';
import '../models/patient.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name = '';
  late String _email = '';
  late String _photoUrl = '';

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Patient'),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                              decoration: const InputDecoration(labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
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
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final newPatient = Patient(
                                id: '', // Generate ID or use Firebase's auto ID
                                name: _name,
                                email: _email,
                                photoUrl: _photoUrl, phone: '',
                              );
                              patientProvider.addPatient(newPatient);
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Add Patient'),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: patientProvider.patients.length,
                itemBuilder: (context, index) {
                  final patient = patientProvider.patients[index];
                  return ListTile(
                    title: Text(patient.name),
                    subtitle: Text(patient.email),
                    onTap: () {
                      // Handle patient tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

