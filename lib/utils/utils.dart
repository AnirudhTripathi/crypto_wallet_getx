import 'package:get/get.dart';
import 'package:getx_crypto/controllers/asset_controller.dart';
import 'package:getx_crypto/services/http_service.dart';

Future<void> registerServices() async {
  Get.put(HTTPService());
}

Future<void> registerControllers() async {
  Get.put(AssetController());
}
