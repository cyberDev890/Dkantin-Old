// views/riwayat_screen_view.dart
// ignore_for_file: use_build_context_synchronously

import 'package:dikantin_o_l_d/app/repository/formatRupiah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../laporan/controllers/laporan_controller.dart';

class RiwayatScreenView extends GetView<LaporanController> {
  RiwayatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register the controller using Get.put
    final controller = Get.put(LaporanController());
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Scaffold(
        body: FutureBuilder(
          future: controller.fetchRiwayat(),
          builder: (context, snapshot) {
            final totalKeseluruhan =
                controller.riwayatData.value!.data.dataTotal ?? 0;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(() => Column(
                    children: [
                      Text(
                        totalKeseluruhan.toRupiah(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blue),
                      ),
                      Text(
                        'Total Keseluruhan',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'List Riwayat',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Obx(() => Text(
                                    controller.date.value,
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )),
                              IconButton(
                                onPressed: () {
                                  _showBottomSheet(context);
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          shrinkWrap: true,
                          itemCount: controller
                              .riwayatData
                              .value!
                              .data
                              .dataRiwayat
                              .length, // Replace with the desired number of items
                          itemBuilder: (context, index) {
                            return RiwayatCard(
                              namaMenu: controller.riwayatData.value!.data
                                      .dataRiwayat[index].nama ??
                                  'null',
                              qty: controller.riwayatData.value!.data
                                      .dataRiwayat[index].qty
                                      .toString() ??
                                  'null',
                              status: controller.riwayatData.value!.data
                                      .dataRiwayat[index].statusPengiriman ??
                                  'null',
                              subTotalPerItem: controller.riwayatData.value!
                                      .data.dataRiwayat[index].subtotalBayar
                                      .toString() ??
                                  'null',
                              tanggal: controller.riwayatData.value!.data
                                      .dataRiwayat[index].createdAt
                                      .toLocal()
                                      .toString() ??
                                  'null',
                              transaksi: controller.riwayatData.value!.data
                                      .dataRiwayat[index].kodeTr ??
                                  'null',
                              total: controller
                                      .riwayatData.value!.data.dataTotal
                                      .toString() ??
                                  'null',
                              typePembayaran: controller.riwayatData.value!.data
                                      .dataRiwayat[index].modelPembayaran ??
                                  'null',
                              harga: controller.riwayatData.value!.data
                                  .dataRiwayat[index].harga,
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            }
          },
        ),
      ),
    );
  }

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    TextEditingController dateFromController = TextEditingController();
    TextEditingController dateToController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text('Cancel')),
                  InkWell(
                      onTap: () async {
                        if (!controller.isSemua.value) {
                          controller.setDateFrom(
                              DateTime.parse(dateFromController.text));
                          controller
                              .setDateTo(DateTime.parse(dateToController.text));
                          DateFormat formatter = DateFormat('yyyy-MM-dd');
                          controller.date.value =
                              "${formatter.format(DateTime.parse(dateFromController.text))}-${formatter.format(DateTime.parse(dateToController.text))}";
                        }

                        await controller.fetchRiwayat();

                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text('Done')),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => SwitchListTile(
                    activeColor: Colors.blue,
                    title: Text(
                      'Semua',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: controller.isSemua.value,
                    onChanged: (value) {
                      controller.isSemua.value = value;
                    },
                  )),
              SizedBox(
                height: 10,
              ),
              // Input field for dateFrom
              TextField(
                controller: dateFromController,
                decoration: InputDecoration(
                  labelText: 'Dari Tanggal',
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors
                              .blue, // header background color accentColor: Colors.blue, // select day color
                          colorScheme: ColorScheme.light(primary: Colors.blue),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (selectedDate != null) {
                    dateFromController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    // Set the value of dateNow using the function
                  }
                },
              ),
              SizedBox(height: 16),

// Input field for dateTo
              TextField(
                controller: dateToController,
                decoration: InputDecoration(
                  labelText: 'Ke tanggal',
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors.blue, // header background color
                          colorScheme: ColorScheme.light(primary: Colors.blue),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (selectedDate != null) {
                    dateToController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    // Set the value of dateTo using the function
                  }
                },
              ),

              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class RiwayatCard extends StatelessWidget {
  String typePembayaran;
  String tanggal;
  String transaksi;
  String namaMenu;
  String qty;
  String subTotalPerItem;
  String total;
  String status;
  int harga;

  RiwayatCard(
      {super.key,
      required this.namaMenu,
      required this.qty,
      required this.status,
      required this.subTotalPerItem,
      required this.tanggal,
      required this.total,
      required this.transaksi,
      required this.typePembayaran,
      required this.harga});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              Text(
                "Pembayaran:  ${this.typePembayaran}",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Rp.${this.subTotalPerItem}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          Divider(),
          Text(
            this.tanggal,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Nomor transaksi : ${this.transaksi}',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${this.namaMenu} ',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'x ${this.qty} ',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.harga.toRupiah(),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                'Status: ${this.status}',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
