// views/riwayat_screen_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/riwayat_screen_controller.dart';

class RiwayatScreenView extends GetView<RiwayatScreenController> {
  RiwayatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register the controller using Get.put
    final controller = Get.put(RiwayatScreenController());

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Scaffold(
        body: FutureBuilder(
          future: controller.fetchRiwayat(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(() => Column(
                    children: [
                      Text(
                        "Rp.${controller.riwayatData.value!.data.dataTotal}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blue),
                      ),
                      Text(
                        'Total Keseluruhan',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'List Riwayat',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Obx(() => Text(
                                    controller.date.value,
                                    style: TextStyle(fontSize: 15),
                                  )),
                              IconButton(
                                onPressed: () {
                                  _showBottomSheet(context);
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.blue,
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
                        print(dateToController.text);
                        controller.setDateFrom(
                            DateTime.parse(dateFromController.text));
                        controller
                            .setDateTo(DateTime.parse(dateToController.text));
                        await controller.fetchRiwayat();
                        DateFormat formatter = DateFormat('yyyy-MM-dd');
                        controller.date.value = formatter.format(
                                DateTime.parse(dateFromController.text)) +
                            "-" +
                            formatter
                                .format(DateTime.parse(dateToController.text));
                        Navigator.pop(context); // Close the bottom sheet
                      },
                      child: Text('Done')),
                ],
              ),
              // Input field for dateFrom
              TextField(
                controller: dateFromController,
                decoration: InputDecoration(labelText: 'Dari Tanggal'),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    dateFromController.text = selectedDate.toString();

                    // Set the value of dateNow using the function
                  }
                },
              ),
              SizedBox(height: 16),
              // Input field for dateTo
              TextField(
                controller: dateToController,
                decoration: InputDecoration(labelText: 'Ke tanggal'),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    dateToController.text = selectedDate.toString();
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

  RiwayatCard(
      {super.key,
      required this.namaMenu,
      required this.qty,
      required this.status,
      required this.subTotalPerItem,
      required this.tanggal,
      required this.total,
      required this.transaksi,
      required this.typePembayaran});

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
              Text("Pembayaran:  ${this.typePembayaran}"),
              Text(
                'Rp.${this.total}',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Divider(),
          Text(this.tanggal),
          Text('nomor transaksi : ${this.transaksi}'),
          Text('${this.namaMenu} x${this.qty}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rp.${this.subTotalPerItem}'),
              Text(
                'Status: ${this.status}',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }
}
