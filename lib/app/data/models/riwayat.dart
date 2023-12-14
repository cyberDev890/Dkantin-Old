// To parse this JSON data, do
//
//     final riwayat = riwayatFromJson(jsonString);

import 'dart:convert';

Riwayat riwayatFromJson(String str) => Riwayat.fromJson(json.decode(str));

String riwayatToJson(Riwayat data) => json.encode(data.toJson());

class Riwayat {
  Data data;
  int code;
  bool status;

  Riwayat({
    required this.data,
    required this.code,
    required this.status,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "status": status,
      };
}

class Data {
  List<DataRiwayat> dataRiwayat;
  int? dataTotal;

  Data({
    required this.dataRiwayat,
    required this.dataTotal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataRiwayat: List<DataRiwayat>.from(
            json["dataRiwayat"].map((x) => DataRiwayat.fromJson(x))),
        dataTotal: json["dataTotal"],
      );

  Map<String, dynamic> toJson() => {
        "dataRiwayat": List<dynamic>.from(dataRiwayat.map((x) => x.toJson())),
        "dataTotal": dataTotal,
      };
}

class DataRiwayat {
  String kodeTr;
  DateTime createdAt;
  String nama;
  int harga;
  int qty;
  int subtotalBayar;
  String statusPengiriman;
  String customerName;
  String noTelepon;
  dynamic username;
  String modelPembayaran;

  DataRiwayat({
    required this.kodeTr,
    required this.createdAt,
    required this.nama,
    required this.harga,
    required this.qty,
    required this.subtotalBayar,
    required this.statusPengiriman,
    required this.customerName,
    required this.noTelepon,
    required this.username,
    required this.modelPembayaran,
  });

  factory DataRiwayat.fromJson(Map<String, dynamic> json) => DataRiwayat(
        kodeTr: json["kode_tr"],
        createdAt: json["tanggal_transaksi"],
        nama: json["nama"],
        harga: json["harga"],
        qty: json["QTY"],
        subtotalBayar: json["subtotal_hargapokok"],
        statusPengiriman: json["status_pengiriman"],
        customerName: json["customer_name"],
        noTelepon: json["no_telepon"],
        username: json["username"],
        modelPembayaran: json["model_pembayaran"],
      );

  Map<String, dynamic> toJson() => {
        "kode_tr": kodeTr,
        "created_at": createdAt.toIso8601String(),
        "nama": nama,
        "harga": harga,
        "QTY": qty,
        "subtotal_bayar": subtotalBayar,
        "status_pengiriman": statusPengiriman,
        "customer_name": customerName,
        "no_telepon": noTelepon,
        "username": username,
        "model_pembayaran": modelPembayaran,
      };
}
