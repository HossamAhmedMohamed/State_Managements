import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/features/bloc_example/presentation/bloc/login_bloc.dart';
import 'package:state_managements/features/bloc_example/presentation/widgets/login_bloc_widget.dart';
import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';

class BlocLoginScreen extends StatelessWidget {
  const BlocLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(Repository(RemoterDataSource(Dio()))),
      child: LoginBlocWidget(),
    );
  }
}
