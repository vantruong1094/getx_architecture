
import 'package:get/get.dart';
import 'package:getx_demo/controllers/sum_controller.dart';

class SumBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SumController());
  }

}