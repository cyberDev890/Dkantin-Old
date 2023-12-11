import 'package:dikantin_o_l_d/app/repository/formatRupiah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  BerandaView({Key? key}) : super(key: key);
  final BerandaController berandaController = Get.put(BerandaController());
  @override
  Widget build(BuildContext context) {
    final penjualanBulanIni =
        berandaController.penghasilan.value.data?.penjualanBulanIni ?? 0;
    final penjualanHariIni =
        berandaController.penghasilan.value.data?.penjualanHariIni ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: null, // remove background color
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff87c6e7),
                Colors.blue,
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                // color: Color(0xffedf3f6),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Image.asset(
                "assets/logo_baru.png",
                width: 20.0,
                height: 20.0,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'DIKANTIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Group_14.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 40,
                    bottom: 50,
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(115, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total penghasilan bulan ini",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Image.asset("assets/toko_icon.png"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => berandaController
                                      .penghasilan.value.data?.penjualanBulanIni
                                      .toString() ==
                                  0
                              ? Text(
                                  "Rp.0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff4a81dc),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  penjualanBulanIni.toRupiah() ?? "Rp.0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff4a81dc),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pendapatan tanggal: " +
                              DateFormat("dd-MM-yyyy").format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Expanded(
                              flex: 2,
                              child: Obx(
                                () => berandaController.penghasilan.value.data
                                            ?.penjualanBulanIni
                                            .toString() ==
                                        0
                                    ? Text(
                                        "Rp.0",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff4a81dc),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        penjualanHariIni.toRupiah() ?? "Rp.0",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff4a81dc),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Obx(
                                () => Text(
                                  'Kantin: ${controller.kantin ?? ''}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Image.asset("assets/Group_2.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  "Transaksi Hari Ini",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff514d4e),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.receipt_rounded,
                                    color: Colors.white,
                                    size: 44,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 4),
                                    child: Obx(
                                      () => Text(
                                        berandaController
                                                .dilayani.value.data?.dilayani
                                                .toString() ??
                                            '0',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Dilayani',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.ssid_chart_rounded,
                                    color: Colors.white,
                                    size: 44,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 4),
                                    child: Obx(
                                      () => Text(
                                        berandaController
                                                .dilayani.value.data?.selesai
                                                .toString() ??
                                            '0',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Selesai',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
