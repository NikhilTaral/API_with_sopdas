import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Appointment/presentation/widgets/Profile_section.dart';
import 'package:project/Appointment/presentation/widgets/avalabal_Slot.dart';
import 'package:project/Appointment/presentation/bloc/appointment_bloc.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';

class AppointmentScreen extends StatelessWidget {
  final List<String> timeSlots = [
    '10:00 - 10:15 AM',
    '10:15 - 10:30 AM',
    '10:30 - 10:45 AM',
    '10:45 - 11:00 AM',
    '11:00 - 11:15 AM',
    '11:15 - 11:30 AM',
    '11:30 - 11:45 AM',
    '11:45 - 12:00 PM',
    '12:00 - 12:15 PM',
  ];

  final Doctor doctor;

  AppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppointmentBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileSection(
                doctor: doctor,
              ),
              
              AvailableSlotsSection(timeSlots: timeSlots),
            ],
          ),
        ),
      ),
    );
  }
}
