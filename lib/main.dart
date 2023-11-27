import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rev_api_database/Modules/App/Home_Screen/Views/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => Home_Screen()),
      ],
    ),
  );
}
