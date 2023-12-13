import 'package:dikantin_o_l_d/app/data/models/Count.dart';
import 'package:dikantin_o_l_d/app/data/models/penghasilan.dart';
import 'package:dikantin_o_l_d/app/data/providers/count_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/providers/penghasilan_provider.dart';

class BerandaController extends GetxController {
  //TODO: Implement BerandaController
  final penghasilanProvider = PenghasilanProvider().obs;
  final CountProvider = countProvider().obs;
  final isLoading = false.obs; // Tambahkan isLoading
  Rx<Penghasilan> penghasilan = Penghasilan().obs;
  Rx<Count> dilayani = Count().obs;

  RxString kantin = ''.obs; // Gunakan RxString
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getToken();
    loadPenghasilan();
    loadDilayaniSelesai();
  }

  @override
  void onReady() {
    super.onReady();
    loadPenghasilan();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadPenghasilan() async {
    try {
      isLoading(true);
      Penghasilan result = await penghasilanProvider.value.loadPenghasilan();
      penghasilan(result);
      isLoading(false);
      update();
    } catch (error) {
      isLoading(false);
      print('Error fetching datad: $error');
    }
  }

  Future<void> loadDilayaniSelesai() async {
    try {
      isLoading(true);
      Count result = await CountProvider.value.loadCount();
      dilayani(result);
      isLoading(false);
      update();
      print('sukses');
    } catch (error) {
      isLoading(false);
      print('Error fetching loadDilayaniSelesai: $error');
    }
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    kantin.value = prefs.getString('id_kantin') ?? ''; // Set nilai RxString
    String token = prefs.getString('token') ?? '';
    print(kantin);
    print(token);
    update(); // Perbarui state setelah mendapatkan nilai baru
  }
}
