import 'package:flutter/material.dart';
import 'package:handinhandup/features/view/signup_screen.dart';
import 'package:handinhandup/features/view/splash_screen.dart';
import '../view/home_sceen.dart';
import '../view/info_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/'://ItemsPage(isVisible: true,)
        return MaterialPageRoute(builder: (_) =>const  SplashScreen());
         case '/info':
        return MaterialPageRoute(builder: (_) => const InfoScreen());
      case '/homeScreen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      
      default:
        return null;
    }
  }
}
