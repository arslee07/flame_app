class BotStatsModel {
  late final List<ShardModel> shards;
  late final int totalGuilds;
  late final int totalUsers;
  late final int totalShards;

  BotStatsModel(
      {required this.shards,
      required this.totalGuilds,
      required this.totalUsers,
      required this.totalShards});

  BotStatsModel.fromJson(Map<String, dynamic> json) {
    this.shards = ShardModel.listFromJson(json['shards']);
    this.totalGuilds = json['totalGuilds'];
    this.totalUsers = json['totalUsers'];
    this.totalShards = json['totalShards'];
  }
}

class ShardModel {
  late final int id;
  late final bool disconnected;
  late final int ping;
  late final int guilds;
  late final int cachedUsers;

  ShardModel(
      {required this.id,
      required this.disconnected,
      required this.ping,
      required this.guilds,
      required this.cachedUsers});

  ShardModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.disconnected = json['disconnected'];
    this.ping = json['ping'];
    this.guilds = json['guilds'];
    this.cachedUsers = json['cachedUsers'];
  }

  static List<ShardModel> listFromJson(list) =>
      List<ShardModel>.from(list.map((json) => ShardModel.fromJson(json)));
}
