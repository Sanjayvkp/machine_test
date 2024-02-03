import 'package:flutter/material.dart';
import 'package:flutter_machine_test/localstorage/shared_preferences.dart';
import 'package:flutter_machine_test/view/login_page.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                Login.removelogged();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              });
            },
            child: Text('Logout')),
      ),
    );
  }
}
