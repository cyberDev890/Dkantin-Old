import 'package:get/get.dart';

import '../../../data/models/RekapHarian.dart';
import '../../../data/providers/rph_provider.dart';

class RekapHarianController extends GetxController {
  //TODO: Implement RekapHarianController
  final isLoading = false.obs; // Tambahkan isLoading
  late Data dataRekapPendapatanHarain = Data();
  final rekapProvider = RekapPendapatanHarian().obs;
  var rekap = <RPH>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadRekapHarian();
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

  Future<void> loadRekapHarian() async {
    try {
      isLoading(true);
      final result = await rekapProvider.value.loadDataRPH();
      dataRekapPendapatanHarain = result;
      rekap.assignAll(result.rPH ?? []);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }
}
