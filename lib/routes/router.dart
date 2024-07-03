import 'package:base_uncia/screens/login/login_screen.dart';
import 'package:base_uncia/screens/network_error_screen.dart';
import 'package:flutter/material.dart';



class Routes {
  static const String splash = "/";
  static const String dashboard = "/dashboard";
  static const String intro = "/intro";
  static const String noNetwork = "no_network";
  static const String login = "/login";

}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      // case Routes.splash:
      //   return MaterialPageRoute(
      //     builder: (_) => const SplashScreen(),
      //     settings: RouteSettings(name: settings.name),
      //   );

        case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: RouteSettings(name: settings.name),
        );

      // case Routes.dashboard:
      //   return MaterialPageRoute(
      //     builder: (_) => const DashboardScreen(),
      //     settings: RouteSettings(name: settings.name),
      //   );

      case Routes.noNetwork:
        return MaterialPageRoute(
          builder: (_) => const NoNetWorkScreen(),
          settings: RouteSettings(name: settings.name),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            )
        );
    }
  }
}