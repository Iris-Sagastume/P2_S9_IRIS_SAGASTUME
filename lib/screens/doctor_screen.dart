// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../models/doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name = '';
  late String _specialty = '';
  late bool _availability = false; // Asigna un valor predeterminado
  late String _photoUrl = '';

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor'),
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
                        child: const Text('Guardar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Agregar Doctor'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorProvider.doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctorProvider.doctors[index];
                return ListTile(
                  title: Text(doctor.name),
                  subtitle: Text(doctor.specialty),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Editar Doctor'),
                                content: Form(
                                  key: _formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          decoration: const InputDecoration(labelText: 'Name'),
                                          initialValue: doctor.name,
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
                                          initialValue: doctor.specialty,
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
                                          initialValue: doctor.photoUrl,
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
                                        final updatedDoctor = Doctor(
                                          id: doctor.id,
                                          name: _name,
                                          specialty: _specialty,
                                          availability: _availability,
                                          photoUrl: _photoUrl,
                                        );
                                        doctorProvider.updateDoctor(updatedDoctor);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Actualizar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Eliminar Doctor'),
                                content: Text('Are you sure you want to delete ${doctor.name}?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      doctorProvider.deleteDoctor(doctor.id);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Eliminar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
