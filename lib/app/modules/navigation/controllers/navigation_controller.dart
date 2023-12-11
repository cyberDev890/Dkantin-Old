import 'package:get/get.dart';

class NavigationController extends GetxController {
  //TODO: Implement NavigationController
  var currentTab = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Tambahkan metode untuk memperbarui currentScreen

  void changeTab(int tabIndex) {
    currentTab.value = tabIndex;
  }
}
