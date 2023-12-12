import 'dart:convert';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/services.dart';
import '../models/RekapHarian.dart';

class RekapPendapatanHarian extends GetxController {
  Future<RekapPendapatanharian> loadDataRPH() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(Api.rph),
      headers: {
        'Authorization':
            'Bearer $token', // Gantilah [TOKEN] dengan token yang sesuai
      },
    );

    if (response.statusCode == 200) {
      return RekapPendapatanharian.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }
}
