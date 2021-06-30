import 'package:flame_app/model/commands_model.dart';
import 'package:flutter/material.dart';

ExpansionTile commandTile(CommandInfoModel command, bool isEven) {
  return ExpansionTile(
    title: Text(
      command.name,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(command.description),
    collapsedBackgroundColor: isEven ? Colors.white : Colors.grey[50],
    expandedAlignment: Alignment.centerLeft,
    children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Использование: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: command.usage,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Задержка (сек.): ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: command.cooldown.toString(),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Нужен премиум: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: command.premium ? "да" : "нет",
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    ],
  );
}
