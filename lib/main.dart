import 'package:flutter/material.dart';
import 'package:frost_app/screens/dashboard.dart';
import 'package:frost_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const LoginPage(),
      home: const DashboardPage(),

      debugShowCheckedModeBanner: false,
    );
  }
}

