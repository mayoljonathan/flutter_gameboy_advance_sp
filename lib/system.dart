import 'package:flutter/material.dart';

import 'screens/bootup_screen.dart';

class System extends ChangeNotifier {
  static final System _system = System._internal();
  factory System() => _system;
  System._internal();

  Widget _widget;
  Widget get widget => _widget;

  bool _hasLoadedCartridge = false;
  bool get hasLoadedCartridge => _hasLoadedCartridge;

  void loadCartridge(Widget cartridge) async {
    print('[loadCartridge] $cartridge');
    _widget = BootupScreen(
      onFinish: () => _onBootupFinish(cartridge),
    );
    notifyListeners();
  }

  void unloadCartridge() {
    _widget = null;
    _hasLoadedCartridge = false;
    notifyListeners();
  }

  void _onBootupFinish(Widget cartridge) {
    _widget = cartridge;
    _hasLoadedCartridge = true;
    notifyListeners();
  }
}
