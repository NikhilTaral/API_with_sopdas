import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project/theme/colors.dart';


class AppointmentSummaryCard extends StatelessWidget {
  final String label;
  final String count;
  final double percentage;

  AppointmentSummaryCard({
    required this.label,
    required this.count,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 180,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.mid,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 9.0,
            percent: percentage,
            center: Text(
              count,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: AppColors.white,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 16.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
