import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('SplashController onReady called');

    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
