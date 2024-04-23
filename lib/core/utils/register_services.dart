import 'package:crypto_wallet/core/services/http_service.dart';
import 'package:get/get.dart';

Future<void> registerServices() async {
  Get.put(
    HTTPService(),
  );
}
