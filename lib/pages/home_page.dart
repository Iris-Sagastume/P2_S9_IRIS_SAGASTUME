import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firestore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            CollectionReference users = FirebaseFirestore.instance.collection('users');

            // Añadir un nuevo documento con ID generado automáticamente
            await users.add({
              'name': 'John Doe',
              'email': 'john.doe@example.com',
            });

            // Leer documentos
            QuerySnapshot querySnapshot = await users.get();
            for (var doc in querySnapshot.docs) {
              // ignore: avoid_print
              print(doc.data());
            }
          },
          child: const Text('Interactuar con Firestore'),
        ),
      ),
    );
  }
}
