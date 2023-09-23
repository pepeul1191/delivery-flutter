import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/user.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController() {
    print('USUARIO DE SESIÓN: ${user.toJson()}');
  }

  void logOut() {
    GetStorage().remove('user');
    Get.toNamed('/login');
  }
}
