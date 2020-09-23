
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/configs/evn/develop.dart';
import 'package:getx_demo/main.dart';

import 'configs/app_configs.dart';

void main() {
  Get.put(AppConfigs.fromJson(config));
  runApp(MyApp());
}