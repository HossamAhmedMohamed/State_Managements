import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/features/cubit_example/presentation/cubit/login_cubit.dart';
import 'package:state_managements/features/cubit_example/presentation/widgets/login_cubit_widget.dart';
import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';

class CubitLoginScreen extends StatelessWidget {
  const CubitLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(Repository(RemoterDataSource(Dio()))),
      child: LoginCubitWidget(),
    );
  }
}
