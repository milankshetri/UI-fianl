import 'package:airfly/dashboard_view.dart';
import 'package:airfly/login_view.dart';
import 'package:airfly/sigup_view.dart';
import 'package:airfly/welcome_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/WelcomeView',
      routes: {
        '/loginRoute': (context) => const loginView(),
        '/signupRoute': (context) => const SignupView(),
        '/welcomeRoute': (context) => const WelcomeView(),
        '/dashboardRoute': (context) => const DashboardView(),
      },
    );
  }
}
