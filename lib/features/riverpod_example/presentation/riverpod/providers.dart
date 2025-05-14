import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';
import 'package:state_managements/features/riverpod_example/presentation/riverpod/auth_notifier.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => RemoterDataSource(Dio()),
);

final authRepositoryProvider = Provider(
  (ref) => Repository(ref.read(authRemoteDataSourceProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authRepositoryProvider)),
);