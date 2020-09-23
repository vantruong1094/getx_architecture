
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StateLayout { showContent, showErrorContent, showEmpty }

class BaseStateLayout extends StatelessWidget {

  final StateLayout stateLayout;
  final Widget child;

  BaseStateLayout({this.stateLayout, this.child});

  @override
  Widget build(BuildContext context) {
    if (stateLayout == StateLayout.showErrorContent) {
      return Container();
    } else if (stateLayout == StateLayout.showEmpty) {
      return Container();
    }

    return child;
  }

}