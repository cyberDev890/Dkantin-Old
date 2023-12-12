import 'package:get/get.dart';

import '../../../data/models/rekapHarianProduk.dart';
import '../../../data/providers/rhp_provider.dart';

class RekapHarianprodukController extends GetxController {
  //TODO: Implement RekapHarianprodukController
  final isLoading = false.obs; // Tambahkan isLoading
  final rekapProvider = RekapHarianProdukProv().obs;
  late RekapharianProduk rekapPendapatanharian = RekapharianProduk();
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
      final result = await rekapProvider.value.loadDataRHP();
      rekapPendapatanharian = result;
      rekapData.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }
}
