import 'package:flutter/foundation.dart';

class MusicPlayerProvider extends ChangeNotifier {
  static final MusicPlayerProvider _musicPlayerProvider = MusicPlayerProvider._internal();
  factory MusicPlayerProvider() => _musicPlayerProvider;
  MusicPlayerProvider._internal();

  int _count = 1;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
