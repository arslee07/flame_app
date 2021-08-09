import 'package:flame_app/controller/commands_controller.dart';
import 'package:flame_app/view/commands/command_tile.dart';
import 'package:flame_app/view/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandsPage extends GetView<CommandsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Команды'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CommandSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: controller.obx((state) {
          return SafeArea(
              child: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              children:
                  List<ExpansionPanelRadio>.generate(state!.length, (index) {
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
                        children: List<ExpansionTile>.generate(elements.length,
                            (index) {
                      return commandTile(elements[index], index.isEven);
                    })),
                    value: index);
              }),
            ),
          ));
        }));
  }
}
