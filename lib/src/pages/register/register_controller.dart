import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../models/user.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    final userProvider = UserProvider();
    print('Email ${email} y password ${password}');

    if (_isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      User user = User(
        email: email,
        name: name,
        lastName: lastname,
        phone: phone,
        image:
            "https://wallpapers.com/images/high/cool-profile-picture-38op6ugjj3nkzjf0.webp",
        password: password,
      );
      print('1 ++++++++++++++++++++++++++++++++++');
      final response = await userProvider.create(user);
      print('2 ++++++++++++++++++++++++++++++++++');
      /*
      userProvider.create(user).then((resp) {
        print('RESPONSE: ${resp.body}');
      }).catchError((error) {
        Get.snackbar(
            'Formulario válido', 'Estas listo para ejecutar una acción HTTP');
      });
      */
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
