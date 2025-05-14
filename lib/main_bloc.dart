import 'package:state_managements/features/bloc_example/presentation/screens/bloc_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlocApp());
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocLoginScreen(),
    );
  }
}
