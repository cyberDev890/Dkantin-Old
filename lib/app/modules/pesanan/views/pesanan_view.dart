import 'package:dikantin_o_l_d/app/data/providers/pesananKantin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../controllers/pesanan_controller.dart';

class PesananView extends GetView<PesananController> {
  const PesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PesananController pesananController = Get.put(PesananController());

    // final AuthService authService = Get.put(AuthService());
    initializeDateFormatting("id_ID");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Group_14.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: MediaQuery.of(context).size.width / 500,
                right: MediaQuery.of(context).size.width / 500,
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(
                    child: Text("PESANAN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 100,
                child: Container(
                  width: 400,
                  height: 50,
                  child: Center(
                    child: Text(
                      DateFormat.yMMMMd("id_ID").format(DateTime.now()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                // height: MediaQuery.of(context).size.height / 1.3,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffedf3f6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(4, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Tekan Tombol Selesai Jika Pesanan Telah Di Antarkan !",
                        style: TextStyle(
                          color: Color(0xff514D4E),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 5, left: 15),
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 1.35,
                              child: Obx(
                                () {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: pesananController
                                          .pesananMemasakOnline.length,
                                      itemBuilder: (context, index) {
                                        final menuData = pesananController
                                            .pesananMemasakOnline[index];

                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                height: 80,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x3f000000),
                                                      offset: Offset(
                                                        0,
                                                        2,
                                                      ),
                                                      blurRadius: 5,
                                                    ),
                                                  ],
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      padding: EdgeInsets.only(
                                                          left: 10, right: 2),
                                                      child: Image.network(
                                                        "http://dikantin.com/" +
                                                            menuData.foto
                                                                .toString(),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        menuData.pesanan
                                                            .toString(),
                                                      ),
                                                      flex: 2,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "x " +
                                                            menuData.jumlah
                                                                .toString(),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    menuData.noMeja
                                                                .toString() ==
                                                            "0"
                                                        ? Expanded(
                                                            child: Text(
                                                              "Pesanan Online",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff514d4e),
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            flex: 1,
                                                          )
                                                        : Expanded(
                                                            child: Text(
                                                              "Meja " +
                                                                  menuData
                                                                      .noMeja
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff514d4e),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            flex: 1,
                                                          ),
                                                    menuData.statusDetail ==
                                                            null
                                                        ? ElevatedButton(
                                                            //offline
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          154,
                                                                          154,
                                                                          154),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                "Memasak"),
                                                          )
                                                        : menuData.statusDetail
                                                                .toString()
                                                                .contains(
                                                                    "menunggu")
                                                            ? ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          231,
                                                                          208,
                                                                          1),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Image.asset(
                                                                          "assets/Logout.png",
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .fitHeight,
                                                                        ),
                                                                        actions: <Widget>[
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              "Pesanan Memasak ?",
                                                                              style: TextStyle(
                                                                                color: Color(0xff3CA2D9),
                                                                                fontWeight: FontWeight.w700,
                                                                                fontSize: 18.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: ElevatedButton(
                                                                                  child: Text('Ya'),
                                                                                  onPressed: () async {
                                                                                    await pesananController.keMemasakOnline(menuData.kantin.toString(), menuData.idMenu, menuData.kodeTr);
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    backgroundColor: Colors.green,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: 8),
                                                                              Expanded(
                                                                                child: ElevatedButton(
                                                                                  child: Text('Tidak'),
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    backgroundColor: Colors.red,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child: const Text(
                                                                    "Memasak"),
                                                              )
                                                            : menuData
                                                                    .statusDetail
                                                                    .toString()
                                                                    .contains(
                                                                        "memasak")
                                                                ? menuData
                                                                        .noMeja
                                                                        .toString()
                                                                        .contains(
                                                                            "0")
                                                                    ? ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return AlertDialog(
                                                                                content: Image.asset(
                                                                                  "assets/Logout.png",
                                                                                  width: 150.0,
                                                                                  height: 150.0,
                                                                                  fit: BoxFit.fitHeight,
                                                                                ),
                                                                                actions: <Widget>[
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Pesanan Selesai ?",
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff3CA2D9),
                                                                                        fontWeight: FontWeight.w700,
                                                                                        fontSize: 18.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: ElevatedButton(
                                                                                          child: Text('Ya'),
                                                                                          onPressed: () async {
                                                                                            await pesananController.keMemasakselesaiOnline(menuData.kantin.toString(), menuData.idMenu, menuData.kodeTr);
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            backgroundColor: Colors.green,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(width: 8),
                                                                                      Expanded(
                                                                                        child: ElevatedButton(
                                                                                          child: Text('Tidak'),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            backgroundColor: Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child: const Text(
                                                                            "Selesai"),
                                                                      )
                                                                    : ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.purple,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return AlertDialog(
                                                                                content: Image.asset(
                                                                                  "assets/Logout.png",
                                                                                  width: 150.0,
                                                                                  height: 150.0,
                                                                                  fit: BoxFit.fitHeight,
                                                                                ),
                                                                                actions: <Widget>[
                                                                                  Center(
                                                                                    child: Text(
                                                                                      "Pesanan Selesai ?",
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff3CA2D9),
                                                                                        fontWeight: FontWeight.w700,
                                                                                        fontSize: 18.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: ElevatedButton(
                                                                                          child: Text('Ya'),
                                                                                          onPressed: () async {
                                                                                            await pesananController.keMemasakselesaiOffline(menuData.kantin.toString(), menuData.idMenu, menuData.kodeTr);
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            backgroundColor: Colors.green,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(width: 8),
                                                                                      Expanded(
                                                                                        child: ElevatedButton(
                                                                                          child: Text('Tidak'),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                            shape: RoundedRectangleBorder(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            backgroundColor: Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child: const Text(
                                                                            "Selesai"),
                                                                      )
                                                                : menuData.statusDetail
                                                                            .toString()
                                                                            .contains(
                                                                                "selesai") &&
                                                                        menuData
                                                                            .noMeja
                                                                            .toString()
                                                                            .contains("0")
                                                                    ? ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.blue,
                                                                        ),
                                                                        onPressed:
                                                                            () async {},
                                                                        child: const Text(
                                                                            "Menunggu"),
                                                                      )
                                                                    : ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.green,
                                                                        ),
                                                                        onPressed:
                                                                            () async {},
                                                                        child: const Text(
                                                                            "Menunggu"),
                                                                      ),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                )),
                                          ],
                                        );
                                      });
                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
