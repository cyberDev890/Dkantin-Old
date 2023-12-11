import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 200),
            child: Image.asset(
              "assets/logo_dikantin.png",
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
