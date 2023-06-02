import 'package:airfly/view/bookflights_view.dart';
import 'package:airfly/view/dashboard.dart';
import 'package:airfly/view/login_view.dart';
import 'package:airfly/view/sigup_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginRoute',
      routes: {
        '/loginRoute': (context) => const LoginView(),
        '/signupRoute': (context) => const SignupView(),
        '/dashboardRoute': (context) => const DashboardView(),
        '/bookflights': (context) => const BookflightView(),
      },
    );
  }
}
