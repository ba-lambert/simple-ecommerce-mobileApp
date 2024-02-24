import 'package:dio/dio.dart';
import 'package:ecommerce_app/services/dio_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthServices {
  final Dio _dio = DioClient.dio;
  Future<void> Signup(String username, String email, String password) async {
    try {
      final response = await _dio.post('/users/signup', data: {
        'email': email,
        'password': password,
        'name': username,
      });
      if (response.statusCode == 201) {
        Get.snackbar('Message', 'User registeration is successfull',
            messageText: const Text(
              'User registration is successful',
              textAlign: TextAlign.center,
            ),
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/');
      } else {
        throw Exception('Failed to sign up  $response');
      }
    } catch (err) {
      throw Exception('Failed to sign up: $err');
    }
  }

  Future<void> Login(String email, String password) async {
    try {
      dynamic response = await _dio.post(
        '/users/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        dynamic responseData = response.data;
        print('$response');
        Get.snackbar('message', '${responseData['user']['name']}',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/home');
        return response;
      } else {
        throw Exception('Something went wrong $response');
      }
    } catch (err) {
      throw Exception('Failed login $err');
    }
  }
}
