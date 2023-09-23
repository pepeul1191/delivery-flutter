import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../providers/user_provider.dart';
import '../../models/response_api.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserProvider userProvider = UserProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print('Email ${email} y password ${password}');

    if (_isValidForm(email, password)) {
      Get.snackbar(
          'Formulario válido', 'Estas listo para ejecutar una acción HTTP');
      ResponseApi responseApi = await userProvider.login(email, password);
      print('Response API: ${responseApi.toString()}');
      if (responseApi.success == true) {
        Get.snackbar('Login Exitoso', responseApi.message ?? '');
      } else {
        Get.snackbar('Login No Exitoso',
            responseApi.message ?? 'Ups, no se sabe si hay error');
      }
    }
  }

  bool _isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un email válido');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar una contraseña');
      return false;
    }
    return true;
  }
}
