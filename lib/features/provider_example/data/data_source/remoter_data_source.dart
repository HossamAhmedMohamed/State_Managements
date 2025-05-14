// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class RemoterDataSource {
  final Dio dio;
  RemoterDataSource(this.dio) {
    dio.options.baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  }

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await dio.post('chef/signin', data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
