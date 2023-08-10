import 'package:flutter/material.dart';
import 'package:to_do_app_hive/auth/login.dart';
import 'package:to_do_app_hive/auth/sign_up.dart';
import 'package:to_do_app_hive/homepage.dart';
import 'package:to_do_app_hive/new_note.dart';

const String signupRoute = 'signup';
const String loginRoute = 'login';
const String homepageRoute = 'homepage';
const String newnoteRoute = 'newnote';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case homepageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case newnoteRoute:
        return MaterialPageRoute(builder: (_) => const NewNote());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(_);
                  },
                  child: const Text('Go back'),
                )
              ],
            ),
          ),
        );
    }
  }
}
