import 'package:get/get.dart';

class RiwayatProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  
}
