import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Doctor_List/presentation/Module_Aip.dart/Module_api.dart';
import 'package:project/Sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:project/Sign_in/presentation/bloc/sign_in_event.dart';
import 'package:project/Sign_in/presentation/bloc/sign_in_state.dart';
import 'package:project/Sign_in/presentation/widgets/Login_button.dart';
import 'package:project/Sign_up/presentation/pages/Signup_Page.dart';
import 'package:project/theme/colors.dart';

class SignIn extends StatefulWidget {
  final Doctor doctor;
  const SignIn({super.key, required this.doctor});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isLargeScreen = screenWidth > 800;

    return Scaffold(
      body: Container(
        color: AppColors.light,
        child: Row(
          children: [
            if (isLargeScreen)
              // Left side
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
            // Right side
            Expanded(
              flex: 3,
              child: Center(
                child: SizedBox(
                  height: screenHeight,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 2),
                          BlocBuilder<SignInBloc, SignInState>(
                            builder: (context, state) {
                              if (state is SignInErrorState) {
                                return Text(
                                  state.ErrorMessage,
                                  style: const TextStyle(color: Colors.red),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "SAPDOS",
                            style: TextStyle(
                              fontSize: isLargeScreen ? 62 : 42,
                              fontWeight: FontWeight.w800,
                              color: AppColors.dark,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: isLargeScreen ? 32 : 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.dark,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Enter existing account's details",
                            style: TextStyle(
                              fontSize: isLargeScreen ? 22 : 16,
                              color: AppColors.gray,
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 60,
                            width: 290,
                            child: TextField(
                              controller: emailController,
                              onChanged: (value) {
                                BlocProvider.of<SignInBloc>(context).add(
                                  SignInTextChangedEvent(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              },
                              decoration: const InputDecoration(
                                labelText: 'Email address/Phone No.',
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: AppColors.dark,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 60,
                            width: 290,
                            child: TextField(
                              controller: passwordController,
                              onChanged: (value) {
                                BlocProvider.of<SignInBloc>(context).add(
                                  SignInTextChangedEvent(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              },
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: AppColors.gray),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.dark)),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.dark,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: togglePassword,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: AppColors.dark,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.dark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Center(
                            child: LoginButton(doctor: widget.doctor),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Not on Sapdos?',
                                style: TextStyle(color: AppColors.dark),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Signup(doctor: widget.doctor),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign-up',
                                  style: TextStyle(
                                    color: AppColors.dark,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
