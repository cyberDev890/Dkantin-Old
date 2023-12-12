import 'package:dikantin_o_l_d/app/modules/riwayat/riwayat_screen/views/riwayat_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Update to match the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: FlutterLogo(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Pelaporan kantin',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
          centerTitle: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Riwayat'),
              Tab(text: 'RPH'),
              Tab(text: 'RHP'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RiwayatScreenView(),
            Center(
              child: Text(
                'RPH',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'RHP',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
