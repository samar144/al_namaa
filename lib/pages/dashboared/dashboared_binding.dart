import 'package:alnamaa_charity/pages/account/account_controller.dart';
import 'package:alnamaa_charity/pages/alert/alert_controller.dart';
import 'package:alnamaa_charity/pages/news_page/news_page_controller.dart';
import 'package:get/get.dart';

import '../../features/sponser/controller/sponser_an_orohan_controller.dart';
import 'dashboared_controller.dart';

class DashBoaredBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<DashBoaredController>(DashBoaredController());
    // Get.put<AlertController>(AlertController());
    // Get.put<NewsController>(NewsController());
    // Get.put<AccountController>(AccountController());
    Get.lazyPut(() => SponserAnOrphaneontroller());
  }
}
