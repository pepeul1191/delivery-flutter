import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print('Email ${email} y password ${password}');

    if (_isValidForm(email, password)) {
      Get.snackbar(
          'Formulario válido', 'Estas listo para ejecutar una acción HTTP');
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
