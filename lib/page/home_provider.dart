import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _count = 0;
  String text = 'You have pushed the button this many times:';
  void incrementCounter() {
    ++_count;
    _changeText();
    notifyListeners();
  }

  void _changeText() {
    text = 'You have pushed the button this $_count times:';
  }

  void decrementCounter() {
    --_count;
    _changeText();
    notifyListeners();
  }

  int get count => _count;
}
