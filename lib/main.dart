import 'package:chalo_milte_hai/resources/auth_method.dart';
import 'package:chalo_milte_hai/screens/home_screen.dart';
import 'package:chalo_milte_hai/screens/login_screen.dart';
// import 'package:chalo_milte_hai/screens/vedio_call_screen.dart';
import 'package:chalo_milte_hai/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
// import 'dart:html';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meeting App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          // '/video-call': (context) => const VedioCallScreen(),
        },
        home: StreamBuilder(
            stream: AuthMethods().authChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return const HomeScreen();
              }
              return const LoginScreen();
            }));
  }
}
