import 'package:flutter/material.dart';
import 'package:login/constant/routes.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Register',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
      routes: {
        registerRoute:(context) => const RegisterPage(),
        loginRoute:(context) => const LoginPage(),
      },
    );
  }
}