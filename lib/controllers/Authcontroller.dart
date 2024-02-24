import 'package:ecommerce_app/services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController {
  final AuthServices _authServices = Get.find<AuthServices>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  void signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final username = usernamecontroller.text.trim();
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      Get.snackbar('Error', 'please enter all fields');
      return;
    }
    try {
      await _authServices.Signup(username, email, password);
      emailController.clear();
      passwordController.clear();
      usernamecontroller.clear();
    } catch (e) {
      Get.snackbar('Error', 'Failed to login:$e');
    }
  }

  void signin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'please enter all fields');
      return;
    }
    try {
      await _authServices.Login(email, password);
      emailController.clear();
      passwordController.clear();
    } catch (err) {
      print('-----------------$err');
      Get.snackbar('Error', 'some thing went wrong $err');
    }
  }
}
