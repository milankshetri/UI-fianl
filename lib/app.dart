import 'package:airfly/login_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginRoute',
      routes: {
        '/loginRoute': (context) => const loginView(),
      },
    );
  }
}
