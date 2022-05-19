import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger_app/Login.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login_page();
  }
}
