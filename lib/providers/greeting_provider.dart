import 'package:flutter/material.dart';

class GreetingProvider extends ChangeNotifier {
  String displayGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good morning";
    }
    if (hour < 17) {
      return "Good afternoon";
    }
    return "Good evening";
  }
}
