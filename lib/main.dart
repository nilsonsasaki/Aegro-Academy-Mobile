import 'package:flutter/material.dart';

import 'package:seeds_catalog/screens/login_screen.dart';
import 'package:seeds_catalog/screens/seed_list_screen.dart';

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
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        SeedsListScreen.routeName: (context) => const SeedsListScreen()
      },
    );
  }
}
