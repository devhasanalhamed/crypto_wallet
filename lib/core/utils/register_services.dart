import 'package:crypto_wallet/app/logic/assets_controller.dart';
import 'package:crypto_wallet/core/services/http_service.dart';
import 'package:get/get.dart';

Future<void> registerServices() async {
  Get.put(
    HTTPService(),
  );
}

Future<void> registerControllers() async {
  Get.put(
    AssetsController(),
  );
}
