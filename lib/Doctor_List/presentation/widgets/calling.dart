
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_bloc.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_event.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_state.dart';
import 'package:project/Doctor_List/presentation/pages/Doctors_List.dart';

// ignore: camel_case_types
class Call_Doctor_List extends StatelessWidget {
  const Call_Doctor_List({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ApiBloc()..add(FetchApiData()),
        child: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is ApiLoading) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is ApiLoaded) {
              return ListDoctur(user: state.apiModel.user);
            } else if (state is ApiError) {
              return Scaffold(
                body: Center(child: Text(state.message)),
              );
            }
            return Scaffold(
              body: Center(child: Text('Unexpected state')),
            );
          },
        ),
      ),
    );
  }
}
