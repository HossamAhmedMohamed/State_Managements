

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/features/riverpod_example/presentation/screens/riverpod_login_screen.dart';

void main() {
  runApp(ProviderScope(child: const RiverpodApp()));
}


class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RiverpodLoginScreen(),
    );
  }
}