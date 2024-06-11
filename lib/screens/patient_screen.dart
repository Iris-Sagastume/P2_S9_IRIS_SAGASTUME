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
        title: const Text('Paciente'),
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
                      title: const Text('Agregar paciente'),
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
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final newPatient = Patient(
                                id: '', // Generate ID or use Firebase's auto ID
                                name: _name,
                                email: _email,
                                photoUrl: _photoUrl,
                                phone: '',
                              );
                              patientProvider.addPatient(newPatient);
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Guardar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Agregar Paciente'),
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Editar Paciente'),
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(labelText: 'Name'),
                                    initialValue: patient.name,
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
                                    initialValue: patient.email,
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
                                    initialValue: patient.photoUrl,
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
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final editedPatient = Patient(
                                      id: patient.id,
                                      name: _name,
                                      email: _email,
                                      photoUrl: _photoUrl,
                                      phone: patient.phone,
                                    );
                                    patientProvider.updatePatient(editedPatient);
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text('Guardar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Eliminar Paciente'),
                              content: const Text('Are you sure you want to delete this patient?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancelar'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    patientProvider.removePatient(patient.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Eliminar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
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
