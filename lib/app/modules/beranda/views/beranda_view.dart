import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  BerandaView({Key? key}) : super(key: key);
  final BerandaController berandaController = Get.put(BerandaController());
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(10),
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
                        Obx(
                          () => berandaController.penghasilan.value.data
                                      ?.penjualanBulanIni ==
                                  ""
                              ? Text(
                                  "Rp.0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff4a81dc),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  'Rp.${berandaController.penghasilan.value.data?.penjualanBulanIni}' ??
                                      "Rp.0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff4a81dc),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 10,
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
                          height: 10,
                        ),
                        Row(
                          children: [
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Expanded(
                              flex: 3,
                              child: Obx(
                                () => berandaController.penghasilan.value.data
                                            ?.penjualanHariIni ==
                                        ""
                                    ? Text(
                                        "Rp.0",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff4a81dc),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        berandaController.penghasilan.value.data
                                                ?.penjualanHariIni ??
                                            "Rp.0",
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

              // Container(
              //   alignment: Alignment.center,
              //   child:
              //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //     SizedBox(width: 10),
              //     Container(
              //       width: 160,
              //       height: 100,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(15),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black26,
              //             offset: Offset(2, 2),
              //             blurRadius: 5,
              //           ),
              //         ],
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Expanded(
              //             child: ClipRect(
              //               child: Align(
              //                 alignment: Alignment(-0.5, 0.1),
              //                 child: Transform.scale(
              //                   scale: 1.5,
              //                   child: Image(
              //                     image: AssetImage("assets/succes.png"),
              //                     fit: BoxFit.contain,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(top: 0, bottom: 0, left: 25),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Selesai",
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color(0xff84d895),
              //                   ),
              //                 ),
              //                 FutureBuilder<int>(
              //                   future: listSuccess
              //                       .getsuccesdate(), // Perubahan pada nama metode
              //                   builder: (context, snapshot) {
              //                     final jumlahListSuccess = snapshot.data!;
              //                     if (snapshot.connectionState ==
              //                         ConnectionState.waiting) {
              //                       // Menambahkan pengecekan jika data masih dalam proses pengambilan
              //                       return CircularProgressIndicator(); // Misalnya, tampilkan loading indicator
              //                     } else if (snapshot.hasData) {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '$jumlahListSuccess',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff84d895),
              //                           ),
              //                         ),
              //                       );
              //                     } else if (snapshot.hasError) {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '0',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff84d895),
              //                           ),
              //                         ),
              //                       );
              //                       // return Text('Error: ${snapshot.error}');
              //                     } else {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '0',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff84d895),
              //                           ),
              //                         ),
              //                       );
              //                     }
              //                   },
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: 10),
              //     Container(
              //       width: 160,
              //       height: 100,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(15),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black26,
              //             offset: Offset(2, 2),
              //             blurRadius: 5,
              //           ),
              //         ],
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Expanded(
              //             child: ClipRect(
              //               child: Align(
              //                 alignment: Alignment(-0.5, 0.1),
              //                 child: Transform.scale(
              //                   scale: 1.5,
              //                   child: Image(
              //                     image:
              //                         AssetImage("assets/tabler_loader-3.png"),
              //                     fit: BoxFit.contain,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             margin: EdgeInsets.only(top: 0, bottom: 0, left: 25),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Dilayani",
              //                   style: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color(0xff87C6E7),
              //                   ),
              //                 ),
              //                 FutureBuilder<int>(
              //                   future: listProses
              //                       .getprosesdate(), // Perubahan pada nama metode
              //                   builder: (context, snapshot) {
              //                     final jumlahListProses = snapshot.data!;
              //                     if (snapshot.connectionState ==
              //                         ConnectionState.waiting) {
              //                       // Menambahkan pengecekan jika data masih dalam proses pengambilan
              //                       return CircularProgressIndicator(); // Misalnya, tampilkan loading indicator
              //                     } else if (snapshot.hasData) {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '$jumlahListProses',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff87C6E7),
              //                           ),
              //                         ),
              //                       );
              //                     } else if (snapshot.hasError) {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '0',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff84d895),
              //                           ),
              //                         ),
              //                       );
              //                       // return Text('Error: ${snapshot.error}');
              //                     } else {
              //                       return Container(
              //                         margin:
              //                             EdgeInsets.only(left: 40, bottom: 5),
              //                         child: Text(
              //                           '0',
              //                           style: TextStyle(
              //                             fontSize: 30,
              //                             fontWeight: FontWeight.bold,
              //                             color: Color(0xff84d895),
              //                           ),
              //                         ),
              //                       );
              //                     }
              //                   },
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ]),
              // ),

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
                                    child: Text(
                                      "0",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
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
                                    child: Text(
                                      "0",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
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
