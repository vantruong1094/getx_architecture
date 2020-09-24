
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/presentation/base/base_state_layout.dart';

class BaseController extends GetxController {
  Rx<StateLayout> stateLayout = StateLayout.showContent.obs;
  void showLoadingView() {
    if (Get.isDialogOpen) {
      return;
    }
    Get.dialog(
      Center(
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void hideLoadingView() {
    if (Get.isDialogOpen) {
      Get.back();
    }
  }
}