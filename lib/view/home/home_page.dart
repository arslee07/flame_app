import 'package:flame_app/controller/home_controller.dart';
import 'package:flame_app/view/commands/commands_page.dart';
import 'package:flame_app/view/home/home_page_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) {
          return IndexedStack(
            index: c.selectedIndex,
            children: [
              Center(
                child: Text('здесь пока ничего нет'),
              ),
              CommandsPage()
            ],
          );
        },
      ),
      bottomNavigationBar: HomePageNavbar(),
    );
  }
}
