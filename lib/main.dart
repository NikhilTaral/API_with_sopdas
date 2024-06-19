import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project/Appointment/presentation/bloc/appointment_bloc.dart';
import 'package:project/Appointment/presentation/pages/appointment_Page.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/Doctor_List/presentation/pages/Doctors_List.dart';
import 'package:project/Doctor_Screen/presentation/pages/Doctur_Home.dart';
import 'package:project/Sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:project/Sign_in/presentation/pages/Signin_Page.dart';
import 'package:project/Sign_up/presentation/pages/Signup_Page.dart';
import 'package:project/WelcomScreen/Welcome.dart';
import 'package:project/paitent_Detils/presentation/pages/paitent_Detils.dart';
import 'package:project/payment/presentation/pages/Payment.dart';
import 'package:project/payment/presentation/pages/popup.dart';

void main() {
  Doctor doctor = Doctor(
    name: 'hi',
    doctorImage: '',
    doctorName: '',
    specialization: '',
    appointmentIcon: '',
    price: 1,
    id: '',
    imageUrl: '',
    location: '',
  );

  runApp(MyApp(
    doctor: doctor,
    
  ));
}

class MyApp extends StatelessWidget {
  final Doctor doctor;
  
 

  const MyApp({
    super.key,
    required this.doctor,
    
  });

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Home(doctor: doctor),
        ),
        GoRoute(
          path: '/SignIn',
          builder: (context, state) => SignIn(doctor: doctor),
        ),
        GoRoute(
          path: '/SignUp',
          builder: (context, state) => Signup(doctor: doctor),
        ),
        GoRoute(
          path: '/Appointment',
          builder: (context, state) => AppointmentScreen(doctor: doctor),
        ),
        GoRoute(
          path: '/ListDoctur',
          builder: (context, state) => const ListDoctur(user: User),
        ),
        GoRoute(
          path: '/DocturHome',
          builder: (context, state) => DocturHome(doctor: doctor),
        ),
        GoRoute(
          path: '/PatientRecord',
          builder: (context, state) => PatientRecord(doctor: doctor),
        ),
        GoRoute(
          path: '/Payment',
          builder: (context, state) => Payment(),
        ),
        GoRoute(
          path: '/Az',
          builder: (context, state) => Az(),
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => AppointmentBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
