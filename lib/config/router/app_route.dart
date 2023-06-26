import 'package:airfly/features/auth/presentation/view/login_view.dart';
import 'package:airfly/features/auth/presentation/view/sigup_view.dart';
import 'package:airfly/features/home/presentation/view/homeview.dart';
import 'package:airfly/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const Register(),
    };
  }
}
