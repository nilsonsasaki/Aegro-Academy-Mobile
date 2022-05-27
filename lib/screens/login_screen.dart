import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:seeds_catalog/screens/seed_list_screen.dart';
import 'package:seeds_catalog/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 100,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    /*const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    ),*/
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, SeedsListScreen.routeName);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have a account yet? ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'Click here!',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SignupScreen.routeName);
                                },
                            ),
                          ],
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
