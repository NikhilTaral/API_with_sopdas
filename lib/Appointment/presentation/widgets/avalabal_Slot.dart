import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Appointment/presentation/bloc/appointment_bloc.dart';
import 'package:project/Appointment/presentation/bloc/appointment_event.dart';
import 'package:project/Appointment/presentation/bloc/appointment_state.dart';
import 'package:project/theme/colors.dart';
import 'package:project/payment/presentation/pages/Payment.dart';

class AvailableSlotsSection extends StatelessWidget {
  final List<String> timeSlots;

  const AvailableSlotsSection({super.key, required this.timeSlots});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
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
                    Icon(
                      Icons.access_alarm,
                      color: AppColors.white,
                    ),
                    Text(
                      "Available Slots",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<AppointmentBloc, AppointmentState>(
              builder: (context, state) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width < 600 ? 1 : 3,
                    childAspectRatio: 8,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  itemCount: timeSlots.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: AppColors.light,
                      child: GridTile(
                        child: ListTile(
                          title: Text(
                            timeSlots[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          leading: Radio(
                            value: timeSlots[index],
                            groupValue: state.selectedSlot,
                            onChanged: (String? value) {
                              context
                                  .read<AppointmentBloc>()
                                  .add(SelectTimeSlot(value!));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Payment(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Text(
              'Book Appointment',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
