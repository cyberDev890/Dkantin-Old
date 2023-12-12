import 'dart:html';

import 'package:dikantin_o_l_d/app/data/providers/rekapHarianPerproduk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RekapHarianprodukController extends GetxController {
  //TODO: Implement RekapHarianController
  final isLoading = false.obs; // Tambahkan isLoading
  final dataRekapPendapatanHarain = RekapHarianProduk().obs;
  var dateRange = DateTimeRange(
          start: DateTime.now(),
          end: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 6))
      .obs;
  // final modelRPH = <RekapHarian>[].obs;

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

  chooseDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: Get.context!,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
        initialDateRange: dateRange.value);
    if (picked != null && picked != dateRange.value) {
      dateRange.value = picked;
    }
  }

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
