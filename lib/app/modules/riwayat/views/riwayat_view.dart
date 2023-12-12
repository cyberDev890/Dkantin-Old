import 'package:dikantin_o_l_d/app/modules/laporan/views/laporan_view.dart';
import 'package:dikantin_o_l_d/app/modules/rekapHarian/views/rekap_harian_view.dart';
import 'package:dikantin_o_l_d/app/modules/rekapHarianproduk/views/rekap_harianproduk_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  RiwayatView({Key? key}) : super(key: key);
  final RiwayatController riwayatController = Get.put(RiwayatController());
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final myAppbar = AppBar(
      elevation: 5, // Menghilangkan shadow di bawah AppBar
      backgroundColor: Colors.white,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Pesanan Saya ",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
      title: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
        child: Image.asset(
          'assets/logo_dikantin.png',
          height: 90, // Sesuaikan dengan tinggi yang Anda inginkan
          width: 90, // Sesuaikan dengan lebar yang Anda inginkan
          fit: BoxFit.cover,
        ),
      ),
      bottom: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          controller: riwayatController.tabController,
          tabs: [
            Tab(
              child: Text(
                "Riwayat",
              ),
            ),
            Tab(
              child: Text(
                "RPH",
              ),
            ),
            Tab(
              child: Text(
                "RHP",
              ),
            ),
          ],
          labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight:
                  FontWeight.normal, // Font Weight untuk yang tidak terpilih
            ),
          )),
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: myAppbar,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: TabBarView(
                controller: riwayatController.tabController,
                children: [
                  LaporanView(),
                  RekapHarianView(),
                  RekapHarianprodukView()
                ]),
          )),
    );
  }
}
