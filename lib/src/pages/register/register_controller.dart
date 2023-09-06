import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void register() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    print('Email ${email} y password ${password}');

    if (_isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      Get.snackbar(
          'Formulario válido', 'Estas listo para ejecutar una acción HTTP');
    }
  }

  bool _isValidForm(String email, String name, String lastname, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un email válido');
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un nombre');
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar un apellido');
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar(
          'Formulario no válido', 'Debe de ingresar tu número telefónico');
      return false;
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no válido',
          'Debe de ingresar la confirmación de tu contraseña');
      return false;
    }
    if (confirmPassword != password) {
      Get.snackbar('Formulario no válido', 'Los password no coinciden.');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario no válido', 'Debe de ingresar una contraseña');
      return false;
    }
    return true;
  }
}
