import 'package:flame_app/controller/commands_controller.dart';
import 'package:flame_app/view/commands/command_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandsPage extends GetView<CommandsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Команды'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: controller.obx((state) {
          return SafeArea(
              child: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children:
                  List<ExpansionPanelRadio>.generate(state!.length, (index) {
                Get.log(state.entries.elementAt(index).key);
                var title = state.entries.elementAt(index).key;
                var elements = state.entries.elementAt(index).value;
                return ExpansionPanelRadio(
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                          title: Text(
                        title.capitalizeFirst.toString(),
                      ));
                    },
                    body: Column(
                        children: List<ExpansionTile>.generate(
                            elements.length,
                            (index) =>
                                commandTile(elements[index], index.isEven))),
                    value: index);
              }),
            ),
          ));
        }));
  }
}
