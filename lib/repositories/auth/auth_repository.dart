import 'dart:convert';
import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<String> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/integration/customer/token',
        data: {
          "username": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return response.data.replaceAll('"', '');
      } else {
        throw Exception('Invalid response code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  Future<Map<String, dynamic>> getUserInfo(String email, String token) async {
    try {
      Response response = await _dio.get(
        'https://magento-1194376-4209178.cloudwaysapps.com/rest/V1/customers/search?searchCriteria[filterGroups][0][filters][0][field]=email&searchCriteria[filterGroups][0][filters][0][value]=$email',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        throw Exception('Invalid response code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting user info: $e');
    }
  }
}
