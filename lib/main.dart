import 'package:flutter/material.dart';

import 'package:seeds_catalog/screens/login_screen.dart';
import 'package:seeds_catalog/screens/seed_list_screen.dart';
import 'package:seeds_catalog/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        SeedsListScreen.routeName: (context) => const SeedsListScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
      },
    );
  }
}
