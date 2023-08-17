import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    ),
  );
}
