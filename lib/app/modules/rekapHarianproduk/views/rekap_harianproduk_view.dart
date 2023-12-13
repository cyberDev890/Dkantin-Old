import 'package:dikantin_o_l_d/app/repository/formatRupiah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/rekap_harianproduk_controller.dart';

class RekapHarianprodukView extends GetView<RekapHarianprodukController> {
  RekapHarianprodukView({Key? key}) : super(key: key);
  final RekapHarianprodukController rekapHarianController =
      Get.put(RekapHarianprodukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => rekapHarianController.loadHarianProdukAll(),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  info(context),
                  saldo(context),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  listItems(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItems(BuildContext context) {
    final baseColorHex = 0xFFE0E0E0;
    final highlightColorHex = 0xFFC0C0C0;
    final mediaHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Container(
      child: Obx(() {
        if (rekapHarianController.isLoading.value) {
          return Shimmer.fromColors(
            baseColor: Color(baseColorHex),
            highlightColor: Color(highlightColorHex),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: mediaHeight,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: mediaHeight * 0.25,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        } else if (rekapHarianController.rekapPendapatanharian.data?.isEmpty ??
            true) {
          return Container(
              height: mediaHeight * 0.25,
              child: Center(
                child: Lottie.asset('assets/animation_lokcom8c.json',
                    repeat: false),
              ));
        } else {
          return ListView.builder(
              itemCount:
                  rekapHarianController.rekapPendapatanharian.data!.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final rekapMenu =
                    rekapHarianController.rekapPendapatanharian.data![index];

                final harga = rekapMenu.harga ?? 0;
                final hargaPendapatan = rekapMenu.totalPendapatan ?? 0;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: Color(0xffF7F7F7),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 199, 199, 199),
                              blurRadius: 0.4,
                              offset: Offset(1, 2))
                        ]),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Kode Barang : ${rekapMenu.idMenu}',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500))),
                            Text(
                              rekapMenu.totalPendapatan.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 16, 99, 224),
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                        Divider(),
                        Text('Nama Barang :${rekapMenu.nama}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Harga Barang :${harga.toRupiah()}'),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Jumlah yang di pesan : ${rekapMenu.totalQty}Item'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }

  Widget info(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                size: 24.0,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '''RPH (Rekap Pendapatan Harian) Merekap \nsemua pendapatan anda setiap produk \nyang ada jual, juga terdapat filter \ntanggal  yaitu dengan cara pilih  \n"2023-03-01"
            ''',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget saldo(BuildContext context) {
    final total = rekapHarianController.rekapPendapatanharian.data2 ?? 0;
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Saldo',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ),
              Text(
                total.toRupiah(),
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 16, 99, 224),
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.dateRange.value.start)
                      .toString(),
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Text(
                ' - ',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
              ),
              Obx(
                () => Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.dateRange.value.end)
                      .toString(),
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    onPressed: () {
                      controller.chooseDateRange();
                    },
                    iconSize: 24,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
