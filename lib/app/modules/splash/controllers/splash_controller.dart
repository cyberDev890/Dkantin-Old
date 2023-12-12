import 'package:dikantin_o_l_d/app/services/notification_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    NotificationService fcmService =  NotificationService();
    fcmService.requestNotificationPermission();
    fcmService.forgroundMessage();
    fcmService.firebaseInit(Get.context!);
    fcmService.setupInteractMessage(Get.context!);
    fcmService.isTokenRefresh();

    fcmService.getDeviceToken().then((value) {
      print("token fcm service" + value);
    });
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
