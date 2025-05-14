import 'package:state_managements/features/cubit_example/presentation/screens/cubit_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CubitApp());
}

class CubitApp extends StatelessWidget {
  const CubitApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CubitLoginScreen(),
    );
  }
}
