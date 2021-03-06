import 'package:culchr/Screens/Forgot/Forgot.dart';
import 'package:culchr/Screens/Forgot/new_password.dart';
import 'package:culchr/Screens/Intro/Intro.dart';
import 'package:culchr/Screens/SignUp/verify.dart';
import 'package:culchr/Screens/login/login.dart';
import 'package:culchr/Screens/profile/profile.dart';
import 'package:culchr/index.dart';
import 'package:flutter/material.dart';

import 'Screens/Home/Home.dart';
import 'Screens/SignUp/Register.dart';
import 'Screens/interests/Interest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culchr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Intro(),
        '/index': (context) => Index(),
        '/register': (context) => Register(),
        '/forgot': (context) => Forgot(),
        '/login': (context) => const Login(),
        '/verify': (context) => const Verify(),
        '/new password': (context) => const NewPassword(),
        '/interests': (context) => const Interest(),
        '/home': (context) => const Home(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
