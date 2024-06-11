import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/doctor_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/patient_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  errorPageBuilder: (context, state) {
    return MaterialPage(
      key: state.pageKey,
      child: const Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      ),
    );
  },
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/doctors',
      builder: (context, state) => const DoctorScreen(),
    ),
    GoRoute(
      path: '/appointments',
      builder: (context, state) => const AppointmentScreen(),
    ),
    GoRoute(
      path: '/patients',
      builder: (context, state) => const PatientScreen(),
    ),
  ],
);

