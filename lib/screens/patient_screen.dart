import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/patient_provider.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Add patient functionality
            },
            child: const Text('Add Patient'),
          ),
          ListView.builder(
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
        ],
      ),
    );
  }
}
