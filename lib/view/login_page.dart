import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_machine_test/localstorage/shared_preferences.dart';
import 'package:flutter_machine_test/view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Here...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 340,
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 213, 213, 213),
                    filled: true,
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 100, 100),
                            width: 3))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 340,
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 213, 213, 213),
                    filled: true,
                    labelText: 'Password',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 100, 100),
                            width: 3))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const ContinuousRectangleBorder(),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (_usernameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        Login.setLogged(_usernameController.text);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ));
                      } else {
                        log('ERROR');
                      }
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
