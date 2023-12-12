import 'package:get/get.dart';

import '../../../data/models/rekapPendapatanHarian.dart';
import '../../../data/providers/rekapPendapatanHarian_provider.dart';

class RekapHarianController extends GetxController {
  //TODO: Implement RekapHarianController
  final isLoading = false.obs; // Tambahkan isLoading
  final dataRekapPendapatanHarain = RekapPendapatanHarian().obs;
  final modelRPH = <RekapHarian>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // loadRekapHarian();
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

  // Future<void> loadRekapHarian() async {
  //   try {
  //     isLoading(true);
  //     final result = await dataRekapPendapatanHarain.value.loadDataRPH();
  //     modelRPH.assignAll(result.rPH ?? []);
  //     isLoading(false);
  //   } catch (error) {
  //     isLoading(false);
  //     print('Error fetching data: $error');
  //   }
  // }
}
