import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/bindings/sum_binding.dart';
import 'package:getx_demo/main.dart';
import 'package:getx_demo/sum_page.dart';

import 'bindings/app_bindings.dart';
import 'controllers/movie_controller.dart';
import 'presentation/ui/movie_page.dart';

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("list movies"),
                onPressed: () {
                  Get.to(MoviePage(), binding: AppBindings());
                },
              ),
              RaisedButton(
                child: Text("back"),
                onPressed: () {
                  Get.back();
                },
              ),
              RaisedButton(
                child: Text("Go Sum Page"),
                onPressed: () {
                  Get.to(SumPage(), binding: SumBinding());
                },
              ),
              RaisedButton(
                child: Text("show snack bar"),
                onPressed: () {
                  if (Get.isSnackbarOpen) {
                    print("snack bar is opening");
                    return;
                  }
                  Get.snackbar("This is title", "This is message ...",
                      backgroundColor: Colors.redAccent,
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(8),
                      duration: Duration(seconds: 2));
                },
              ),
              RaisedButton(
                child: Text("show dialog"),
                onPressed: () {
                  Get.dialog(_androidDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _androidDialog() {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          child: ListBody(
            children: List.generate(
              100,
              (index) {
                return Text("Item $index");
              },
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () {
            if (Get.isDialogOpen) {
              Get.back();
            }
          },
        )
      ],
    );
  }
}
