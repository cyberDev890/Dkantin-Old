import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekap_harian_controller.dart';

class RekapHarianView extends GetView<RekapHarianController> {
  const RekapHarianView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RekapHarianView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RekapHarianView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
