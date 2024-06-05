import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/theme/colors.dart';

//custom_expansion_tile.dart' as custom;

class PatientRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            navigator?.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 140.0,
                    width: 140.0,
                    color: const Color(0xffFF0E58),
                    child: Image.asset(''),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: AppColors.dark,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Patient Name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.dark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(
                            Icons.circle_sharp,
                            color: AppColors.dark,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Patient age',
                            style: TextStyle(color: AppColors.dark),
                          ),
                        ],
                      ),
                      const Text(
                        'Issue description',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: ExpansionTile(
                        leading: const Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        collapsedBackgroundColor: AppColors.dark,
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        title: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 8),
                                  Text(
                                    'Patient History',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: AppColors.dark)),
                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(
                              title: const Text(
                                'Blood report',
                                style: TextStyle(color: AppColors.dark),
                              ),
                              trailing: const Icon(
                                Icons.visibility,
                                color: AppColors.dark,
                              ),
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(height: 14),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: AppColors.dark)),
                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(
                              title: const Text(
                                'CT Scan report',
                                style: TextStyle(color: AppColors.dark),
                              ),
                              trailing: const Icon(
                                Icons.visibility,
                                color: AppColors.dark,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      color: AppColors.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        //backgroundColor: Colors.red,
                        leading: const Icon(
                          Icons.description,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Prescription',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        children: [
                          const SizedBox(height: 14),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: AppColors.dark)),
                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(
                              title: const Text(
                                '26 March 2022',
                                style: TextStyle(color: AppColors.dark),
                              ),
                              trailing: const Icon(
                                Icons.visibility,
                                color: AppColors.dark,
                              ),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: AppColors.dark)),
                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(
                              title: const Text(
                                '13 April 2022',
                                style: TextStyle(color: AppColors.dark),
                              ),
                              trailing: const Icon(
                                Icons.visibility,
                                color: AppColors.dark,
                              ),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                          ),
                          const SizedBox(height: 14),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    width: 3, color: AppColors.dark)),
                            color: Colors.white,
                            elevation: 0,
                            child: ListTile(
                              leading: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              title: const Text(
                                'Add new',
                                style: TextStyle(color: Colors.black),
                              ),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
