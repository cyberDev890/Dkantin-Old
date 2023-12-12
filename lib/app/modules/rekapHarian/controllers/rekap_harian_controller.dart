import 'package:get/get.dart';

import '../../../data/models/RekapHarian.dart';
import '../../../data/providers/rph_provider.dart';

class RekapHarianController extends GetxController {
  //TODO: Implement RekapHarianController
  final isLoading = false.obs; // Tambahkan isLoading
  final rekapProvider = RekapPendapatanHarian().obs;
  late RekapPendapatanharian rekapPendapatanharian = RekapPendapatanharian();
  var rekapData = <Data>[].obs;

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
      rekapPendapatanharian = result;
      rekapData.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }
}
