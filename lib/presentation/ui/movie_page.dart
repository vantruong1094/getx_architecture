import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/movie_controller.dart';

import '../../base_state_layout.dart';

class MoviePage extends GetWidget<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Page"),
      ),
      body: Obx(
        () => BaseStateLayout(
          stateLayout: controller.stateLayout.value,
          child: ListView.builder(
            itemCount: controller.listMovie.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${controller.listMovie.value[index].title}"),
              );
            },
          ),
        ),
      ),
    );
  }

}
