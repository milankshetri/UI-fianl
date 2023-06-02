import 'package:airfly/routes/app_route.dart';
import 'package:airfly/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'view/app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bottom Navigation',
        initialRoute: AppRoute.loginRoute,
        theme: AppTheme.getApplicationTheme(),
        routes: AppRoute.getAppRoutes());
  }
}

void main() {
  runApp(
    const App(),
  );
}
