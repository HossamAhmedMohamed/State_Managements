import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managements/features/getx_example/presentation/getx/getx_auth_notifier.dart';
import 'package:state_managements/features/getx_example/presentation/screens/getx_login_screen.dart';
import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';

void main() {
  final repository = Repository(
    RemoterDataSource(Dio()),
  );  
  Get.put(GetXAuthController(repository));
  runApp(const GetXApp());
}


class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GetXLoginScreen(),
    );
  }
}