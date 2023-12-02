import 'package:chalo_milte_hai/resources/auth_method.dart';
import 'package:chalo_milte_hai/widgets/custom_button.dart';
import 'package:flutter/material.dart';
// import 'dart:html';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Start or join a meeting',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // Image.asset('assets/images/onboarding.jpg'),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Image(image: AssetImage('assets/images/onboarding.jpg')),
        ),
        CustomButton(
          text: 'Login',
          onPressed: () async {
            bool res = await _authMethods.signInWithGoogle(context);
            if (res) {
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, '/home');
            }
          },
        )
      ],
    ));
  }
}
