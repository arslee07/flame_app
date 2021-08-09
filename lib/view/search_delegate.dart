import 'package:flame_app/controller/commands_controller.dart';
import 'package:flame_app/model/commands_model.dart';
import 'package:flame_app/view/commands/command_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandSearchDelegate extends SearchDelegate {
  final controller = Get.find<CommandsController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.trim() != '')
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return controller.obx((state) {
      List<CommandInfoModel> elements = [];
      if (query.trim() != '') {
        controller.state!.values
            .toList()
            .forEach((list) => elements.addAll(list));
        elements = elements
            .where((element) => element.name.contains(query.trim()))
            .toList();
      }

      return ListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return commandTile(elements[index], index.isEven);
          });
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return controller.obx((state) {
      List<CommandInfoModel> elements = [];
      if (query.trim() != '') {
        controller.state!.values
            .toList()
            .forEach((list) => elements.addAll(list));
        elements = elements
            .where((element) => element.name.contains(query.trim()))
            .toList();
      }

      return ListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return commandTile(elements[index], index.isEven);
          });
    });
  }
}
