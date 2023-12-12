import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  const LaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return listItems(context, index);
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItems(BuildContext context, int index) {
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
                Text('Kode Barang : ' + '3',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                Text(
                  'Rp.1000',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 16, 99, 224),
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
            Divider(),
            Text('Nama Barang : Ayam Bakar'),
            SizedBox(
              height: 5,
            ),
            Text('Harga Barang : Rp10.000'),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah yang di pesan : 1 Item'),
              ],
            ),
          ],
        ),
      ),
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
                '''RPH (Rekap Pendapatan Harian) Merekap \n semua pendapatan anda tiap harinya \n yang memungkinkan anda jika terdapat \n rekap harian, yaitu dengan cara pilih \n "2023-03-01"
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
                'Rp400.404',
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
              Text(
                '2023-06-11 - 2023-12-11 ',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 24,
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
