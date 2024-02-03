import 'package:flutter/material.dart';
import 'package:flutter_machine_test/localstorage/shared_preferences.dart';
import 'package:flutter_machine_test/view/homepage.dart';
import 'package:flutter_machine_test/view/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: Login.getLogged(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const LoginPage();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return const HomePage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
