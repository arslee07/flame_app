import 'package:flame_app/model/commands_model.dart';
import 'package:get/get.dart';

const baseUrl = 'https://api.flamebot.ru/public/';

class FlameApi extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  Future<Response<List<CommandInfoModel>>> commands() async =>
      await get('commands', decoder: CommandInfoModel.listFromJson);
}
