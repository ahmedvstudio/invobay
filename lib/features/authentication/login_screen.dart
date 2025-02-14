import 'package:flutter/material.dart';
import 'package:invobay/features/authentication/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('logo'),
                  const Text('Username'),
                  TextFormField(),
                  const Text('Password'),
                  TextFormField(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text('signup'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
