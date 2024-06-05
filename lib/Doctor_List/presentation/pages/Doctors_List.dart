// pages/doctor_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_bloc.dart';
import 'package:project/Doctor_List/presentation/bloc/doctor_list_state.dart';
import 'package:project/Doctor_List/presentation/widgets/Doctors.dart';
import 'package:project/theme/colors.dart';

class ListDoctur extends StatelessWidget {
  final User user;

  const ListDoctur({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isLargeScreen = screenSize.width > 600;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.dark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(),
              child: Text(
                'SAPDOS',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 44,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined,
                    color: AppColors.white),
                title: const Text(
                  'Categories',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {}),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined,
                  color: AppColors.white),
              title: const Text(
                'Appointment',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.chat_bubble, color: AppColors.white),
              title: Text(
                'Chat',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings, color: AppColors.white),
              title: Text(
                'Settings',
                style: TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.logout, color: AppColors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                onTap: () {}),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: isLargeScreen ? 50 : 30,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.greeting,
                              style: TextStyle(
                                fontSize: isLargeScreen ? 32 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              user.name,
                              style: TextStyle(
                                fontSize: isLargeScreen ? 32 : 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: isLargeScreen ? 60 : 30,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Card(
                    color: AppColors.dark,
                    elevation: 8,
                    child: SizedBox(
                      height: 45,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Doctor's List",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                            Icon(
                              Icons.filter_list,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<ApiBloc, ApiState>(
                      builder: (context, state) {
                        if (state is ApiLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is ApiLoaded) {
                          return GridView.count(
                            crossAxisCount: isLargeScreen ? 2 : 1,
                            childAspectRatio:
                                isLargeScreen ? (1 / .3) : (1 / .4),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: state.apiModel.doctorsList.map((doctor) {
                              return buildDoctorCard(
                                  context, doctor, isLargeScreen);
                            }).toList(),
                          );
                        } else if (state is ApiError) {
                          return Center(child: Text(state.message));
                        }
                        return Center(child: Text('Unexpected state'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
