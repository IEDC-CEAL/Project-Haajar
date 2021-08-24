import 'package:flutter/material.dart';

class FormScrollBehaviourClass extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
