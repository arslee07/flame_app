class CommandInfoModel {
  late final String name;
  late final String description;
  late final String category;
  late final String usage;
  late final List<String> aliases;
  late final List<String> examples;
  late final int cooldown;
  late final bool premium;
  late final List<String> userPermissions;
  late final List<String> clientPermissions;

  CommandInfoModel(
      {required this.name,
      required this.description,
      required this.category,
      required this.usage,
      required this.aliases,
      required this.examples,
      required this.cooldown,
      required this.premium,
      required this.userPermissions,
      required this.clientPermissions});

  CommandInfoModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.description = json['description'];
    this.category = json['category'] ?? 'general';
    this.usage = json['usage'];
    this.aliases = List<String>.from(json['aliases']);
    this.examples = List<String>.from(json['examples']);
    this.cooldown = json['cooldown'];
    this.premium = json['premium'];
    this.userPermissions = List<String>.from(json['userPermissions']);
    this.clientPermissions = List<String>.from(json['clientPermissions']);
  }

  static Map<String, List<CommandInfoModel>> mapFromJson(json) {
    print(json.length);
    var list = CommandInfoModel.listFromJson(json);
    return CommandInfoModel.mapFromList(list);
  }

  static List<CommandInfoModel> listFromJson(list) {
    return List<CommandInfoModel>.from(list.map((json) {
      return CommandInfoModel.fromJson(json);
    }));
  }

  static Map<String, List<CommandInfoModel>> mapFromList(
      List<CommandInfoModel> list) {
    final Map<String, List<CommandInfoModel>> categories = {};
    list.forEach((CommandInfoModel command) {
      print(command.category);
      categories[command.category] = [
        ...?categories[command.category],
        command
      ];
    });
    return categories;
  }
}
