import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

  final count = 0.obs;
  RxString username = ''.obs; // Gunakan RxString
  RxString email = ''.obs; // Gunakan RxString

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> logout() async {
    // Hapus data dari SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // Navigasi ke halaman login
    Get.offAllNamed('/login');
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? ''; // Set nilai RxString
    email.value = prefs.getString('email') ?? ''; // Set nilai RxString
    update(); // Perbarui state setelah mendapatkan nilai baru
  }
}
