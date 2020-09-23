import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/main.dart';
import 'configs/app_configs.dart';
import 'configs/evn/staging.dart';

void main() {
  Get.put(AppConfigs.fromJson(config));
  runApp(MyApp());
}