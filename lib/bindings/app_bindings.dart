
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:get/get.dart';
import 'package:getx_demo/configs/app_configs.dart';
import 'package:getx_demo/controllers/movie_controller.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(MovieController());
  }
}