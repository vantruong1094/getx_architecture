import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/base_state_layout.dart';

class SumController extends GetxController with WidgetsBindingObserver {
  RxInt number1 = 0.obs;
  RxInt number2 = 0.obs;
  Rx<StateLayout> stateLayout = StateLayout.showContent.obs;

  @override
  void onReady() {
    print("onReady: SumController ");
    WidgetsBinding.instance.addObserver(this);
    requestAPI();
    super.onReady();
  }

  @override
  void onInit() {
    print("onInit: SumController ");
    super.onInit();
  }

  @override
  FutureOr onClose() {
    print("onClose: SumController ");
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: ${state.toString()}");
  }

  Future<void> requestAPI() async {
    showLoadingView();
    await Future.delayed(Duration(seconds: 3));
    hideLoadingView();
//    stateLayout.value = StateLayout.showErrorContent;
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Error",
        content: Text("This is message error"),
        actions: [
          RaisedButton(
            child: Text("OK"),
            onPressed: () => Get.back(),
          ),
          RaisedButton(
            child: Text("Cancel"),
            onPressed: () => Get.back(),
          )
        ]);
  }

  void incrementNum1() {
    number1.value++;
  }

  void incrementNum2() {
    number2.value++;
  }

  int get sum => number1.value + number2.value;

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
