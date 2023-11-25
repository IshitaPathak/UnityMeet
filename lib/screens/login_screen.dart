import 'package:chalo_milte_hai/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Start or join a meeting',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // Image.asset('assets/images/onboarding.jpg'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Image(image: AssetImage('assets/images/onboarding.jpg')),
        ),
        CustomButton(
          text: 'Login',
          onPressed: () {},
        )
      ],
    ));
  }
}
