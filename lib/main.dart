import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Appointment/presentation/bloc/appointment_bloc.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/Sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:project/WelcomScreen/Welcome.dart';

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
      location: ''); 

  runApp(MyApp(doctor: doctor));
}

class MyApp extends StatelessWidget {
  final Doctor doctor;
  const MyApp({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => AppointmentBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => Home(
              doctor: doctor), // Pass the doctor variable to the Home widget
        },
      ),
    );
  }
}
