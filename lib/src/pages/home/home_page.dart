import 'package:delivery/src/pages/home/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomeController control = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Delivery App',
            style: TextStyle(
              color: Colors.white, // Change the color to your desired color
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert, // Change the icon to your desired icon
                color: Colors.white, // Change the color of the icon
              ),
              onSelected: (value) {
                // Handle menu item selection
                if (value == 'logout') {
                  print("LOGOUT");
                  control.logOut();
                }
                // Add more conditions for other menu items as needed
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Salir',
                      style: TextStyle(
                        color: Colors
                            .white, // Change the color to your desired color
                      )),
                ),
                // Add more menu items here
              ],
            ),
          ],
        ),
        body: Center(
          child: Text('HOME PAGE'),
        ));
  }
}
