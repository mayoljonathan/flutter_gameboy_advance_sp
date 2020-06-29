import 'package:flutter/cupertino.dart';

class NumberCounterProvider extends ChangeNotifier {
  static final NumberCounterProvider _numberCounterProvider = NumberCounterProvider._internal();
  factory NumberCounterProvider() => _numberCounterProvider;
  NumberCounterProvider._internal();

  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
