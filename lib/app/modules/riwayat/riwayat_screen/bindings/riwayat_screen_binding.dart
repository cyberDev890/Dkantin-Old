import 'package:get/get.dart';

import '../controllers/riwayat_screen_controller.dart';

class RiwayatScreenBinding extends Bindings {
  @override
  void dependencies() {
    print('init controller');
    Get.lazyPut<RiwayatScreenController>(
      () => RiwayatScreenController(),
    );
  }
}
