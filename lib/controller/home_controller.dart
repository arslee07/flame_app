import 'package:get/get.dart';

class HomeController extends GetxController {
  final _selectedIndex = 0.obs;
  set selectedIndex(value) => this._selectedIndex.value = value;
  get selectedIndex => this._selectedIndex.value;

  changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
