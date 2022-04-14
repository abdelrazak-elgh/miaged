import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the Firebase app in the application.
  await Firebase.initializeApp();
  runApp(const App());
}
