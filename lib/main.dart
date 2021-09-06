import 'package:filmkuu/screens/homepage_screen.dart';
import 'package:filmkuu/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return MaterialApp(
        home: HomeScreen(),
      );
    } else {
      return MaterialApp(
        home: LoginPage(),
      );
    }
  }
}
