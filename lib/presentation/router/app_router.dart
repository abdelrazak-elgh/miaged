import 'package:flutter/material.dart';
import 'package:miaged/presentation/screens/home_screen.dart';
import 'package:miaged/presentation/screens/sign_in.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    appBar: AppBar(
                  backgroundColor: Colors.blueGrey,
                  elevation: 0.0,
                  title: const Text('Miaged'),
                  actions: <Widget>[
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.person, color: Colors.white),
                        label: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )));
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignIn());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }

  void dispose() {}
}
