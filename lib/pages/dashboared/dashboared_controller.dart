import 'package:get/get.dart';

class DashBoaredController extends GetxController {
  var tabIndex = 0;
  void changtabindex(int index) {
    tabIndex = index;
    update();
  }
}
