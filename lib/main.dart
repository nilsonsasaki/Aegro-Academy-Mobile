import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:seeds_catalog/ui/screens/login_screen.dart';
import 'package:seeds_catalog/ui/screens/seed_detail_screen.dart';
import 'package:seeds_catalog/ui/screens/seed_list_screen.dart';
import 'package:seeds_catalog/ui/screens/signup_screen.dart';
import 'package:seeds_catalog/ui/screens/create_seed_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        SeedsListScreen.routeName: (context) => const SeedsListScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        CreateSeedScreen.routeName: (context) => const CreateSeedScreen(),
        SeedDetailScreen.routeName: (context) => SeedDetailScreen()
      },
    );
  }
}
