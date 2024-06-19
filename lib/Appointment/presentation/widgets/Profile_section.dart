import 'package:flutter/material.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';

class ProfileSection extends StatelessWidget {
  final Doctor doctor;

  const ProfileSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        return Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Image.network(
                doctor.doctorImage,
                height: isSmallScreen ? 140 : 220,
                width: isSmallScreen ? 140 : 220,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.doctorName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    doctor.specialization,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Text(
                    'BDS, DDS',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      const Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star_half, color: Colors.orange),
                      Icon(Icons.star_border, color: Colors.orange),
                      SizedBox(width: 5),
                      Text('512'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '5 Years',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmodt in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    textAlign: TextAlign.start,
                    softWrap: true,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
