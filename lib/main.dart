import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/app_bindings.dart';
import 'package:getx_demo/configs/app_configs.dart';
import 'package:getx_demo/presentation/ui/movie_page.dart';
import 'package:getx_demo/second_page.dart';

import 'second_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("baseUrl: ${Get.find<AppConfigs>().apiBaseUrl}");
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SecondPage(),
    );
  }
}