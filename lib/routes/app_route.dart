import 'package:airfly/view/dashboard.dart';
import 'package:airfly/view/login_view.dart';
import 'package:airfly/view/sigup_view.dart';

class AppRoute {
  AppRoute._();

  static const String loginRoute = '/';
  static const String signupRoute = '/signupRoute';
  static const String dashboardRoute = '/dashboardRoute';

  static getAppRoutes() {
    return {
      loginRoute: (context) => const LoginView(),
      signupRoute: (context) => const SignupView(),
      dashboardRoute: (context) => const DashboardView(),
    };
  }
}
