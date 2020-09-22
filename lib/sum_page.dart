import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/base_page.dart';
import 'package:getx_demo/base_state_layout.dart';

import 'controllers/sum_controller.dart';

class SumPage extends GetWidget<SumController> {

  Widget body() {
    return Scaffold(
      appBar: AppBar(
        title: Text("SumPage"),
      ),
      body: Obx(() {
        return BaseStateLayout(
          stateLayout: controller.stateLayout.value,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  print("rebuild text 1");
                  return Text("number 1: ${controller.number1.value}");
                }),

                Obx(() {
                  print("rebuild text 2");
                  return Text("number 2: ${controller.number2.value}");
                }),

                Obx(() {
                  print("rebuild text num");
                  return Text("sum: ${controller.sum}");
                }),

                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text("Num 1 +"),
                  onPressed: () {
                    controller.incrementNum1();
                  },
                ),
                RaisedButton(
                  child: Text("Num 2 +"),
                  onPressed: () {
                    controller.incrementNum2();
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

}