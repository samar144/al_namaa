import 'package:alnamaa_charity/service/network_handler/network_handler.dart';
import 'package:get/get.dart';
import 'package:alnamaa_charity/utils/app_constants.dart';

class ProfileRepo extends GetxService {
  final NetworkHandler networkHandler;
  ProfileRepo({required this.networkHandler});
  Future<Response> getProfileList() async {
    return await networkHandler.getData(AppConstants.DATA_PROFILE);
  }
}
