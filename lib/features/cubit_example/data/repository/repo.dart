import 'package:state_managements/features/riverpod_example/data/data_source/remoter_data_source.dart';

class Repository {
  final RemoterDataSource remoteDataSource;
  Repository(this.remoteDataSource);

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      return response;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}