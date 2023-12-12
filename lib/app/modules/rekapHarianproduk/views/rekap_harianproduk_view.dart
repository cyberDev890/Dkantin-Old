import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekap_harianproduk_controller.dart';

class RekapHarianprodukView extends GetView<RekapHarianprodukController> {
  const RekapHarianprodukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekapHarianprodukView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RekapHarianprodukView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
