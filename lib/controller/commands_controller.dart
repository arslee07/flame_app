import 'package:flame_app/model/commands_model.dart';
import 'package:flame_app/provider/flame_api.dart';
import 'package:get/get.dart';

class CommandsController extends GetxController
    with StateMixin<Map<String, List<CommandInfoModel>>> {
  final provider = Get.find<FlameApi>();

  Future<void> fetch() async {
    Get.log('Fetching GET /commands/');
    change(null, status: RxStatus.loading());
    final Response res = await provider.commands();
    print(res.body.length);
    if (res.hasError) {
      change(null, status: RxStatus.error(res.statusText));
    } else {
      change(CommandInfoModel.mapFromList(res.body),
          status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetch();
  }
}
