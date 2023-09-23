import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './src/pages/home/home_page.dart';
import './src/pages/login/login_page.dart';
import './src/pages/register/register_page.dart';
import './src/models/user.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // stfull
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Udemy',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != 'null' ? '/home' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              primary: Colors.amber,
              secondary: Colors.red,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.amber,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.white)),
      navigatorKey: Get.key,
    );
  }
}
