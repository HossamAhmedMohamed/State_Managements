import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:state_managements/features/provider_example/presentation/provider/provider_auth_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_managements/features/provider_example/presentation/widgets/login_widget.dart';
import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';

class ProviderLoginScreen extends StatelessWidget {
  const ProviderLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderAuthNotifier(Repository(RemoterDataSource(Dio()))),
      child: LoginWidget(),
    );
  }
}
