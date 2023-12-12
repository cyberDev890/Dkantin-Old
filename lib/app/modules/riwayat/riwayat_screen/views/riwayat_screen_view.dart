// views/riwayat_screen_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/riwayat_screen_controller.dart';

class RiwayatScreenView extends GetView<RiwayatScreenController> {
  RiwayatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register the controller using Get.put
    final controller = Get.put(RiwayatScreenController());

    return Scaffold(
      body: Row(
        children: [
          Text(
            '',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
