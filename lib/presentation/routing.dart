import 'package:flutter/material.dart';
import 'package:video_live_project/presentation/ui/home_page.dart';
import 'package:video_live_project/presentation/ui/login_page.dart';
import 'package:video_live_project/presentation/ui/photo_add_page.dart';
import 'package:video_live_project/presentation/ui/registration_page.dart';
import 'package:video_live_project/presentation/ui/registration_verification._page.dart';

import '../internal/application_dependency.dart';
import 'ui/verification_page.dart';

class AppRouting {
  Map<String, Widget Function(BuildContext)> routes = {
    // '/': (context) => const HomePage(),
    // '/': (context) => const RegistrationPage(),
    // '/': (context) => RegistrationPage(),
    'home_page': (context) => const HomePage(),

    '/': (context) => const HomePage(),
    'verificationPage': (context) => const VerificationPage(),
    'registrationVerificationPage': (context) =>
        const RegistrationVerificationPage(),
    'registracionPage': (context) => RegistrationPage(),
  };

  void navigationToPage(
      BuildContext context, String routeName, bool removePrevious,
      [var cubit]) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (route) => removePrevious,
        arguments: {'cubit': cubit});
  }

  void navigationWithAnimation(BuildContext context, Widget widget) {
    Navigator.of(context).push(createRoute(widget));
  }

  Route createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
