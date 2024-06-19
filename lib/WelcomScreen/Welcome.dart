import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/theme/colors.dart';

class Home extends StatelessWidget {
   const Home({super.key, required this.doctor});

  final Doctor doctor;
   const Home({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isLargeScreen = screenWidth > 800;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: AppColors.light,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (isLargeScreen)
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/index.png"),
                            ],
                          ),
                        ),
                      ),
                    Expanded(
                      flex: 3,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SAPDOS',
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 38 : 28,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 19, 35, 90),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 160),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 60.0, left: 60),
                                child: Text(
                                  'Login to your sapdos account or create one now.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: isLargeScreen ? 19 : 22,
                                    color: AppColors.dark,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 70),
                              ElevatedButton(
                                onPressed: () {
                                  context.go('/SignIn');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.dark,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 80,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  context.go('/SignUp');
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 70,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side:
                                        const BorderSide(color: AppColors.dark),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                child: const Text(
                                  'SIGN-UP',
                                  style: TextStyle(color: AppColors.dark),
                                ),
                              ),
                              const SizedBox(height: 80),
                              InkWell(
                                onTap: () {
                                  context.go('/DocturHome');
                                },
                                child: const Text(
                                  'Proceed as a Guest',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
