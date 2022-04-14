import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'common/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
