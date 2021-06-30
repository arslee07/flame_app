import 'package:flame_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageNavbar extends StatelessWidget {
  const HomePageNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (c) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.electrical_services_outlined),
                label: 'Состояние'),
            BottomNavigationBarItem(
                icon: Icon(Icons.smart_toy_outlined), label: 'Команды'),
          ],
          onTap: c.changeIndex,
          currentIndex: c.selectedIndex,
          selectedItemColor: Colors.orange[600],
        );
      },
    );
  }
}

class A {
  int value;
  A({required this.value});
}
