import 'package:flutter/material.dart';
import 'package:flutter_gameboy_advance_sp/cartridges/music_player/providers/music_player_provider.dart';

import 'models/cartridge.dart';
import 'screens/bootup_screen.dart';

class System extends ChangeNotifier {
  static final System _system = System._internal();
  factory System() => _system;
  System._internal();

  // AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  SystemBrightness _brightness = SystemBrightness.LIGHT;
  SystemBrightness get brightness => _brightness;
  void toggleBrightness() {
    if (_brightness == SystemBrightness.LIGHT) {
      _brightness = SystemBrightness.LIGHTEST;
    } else {
      _brightness = SystemBrightness.LIGHT;
    }
    print(_brightness);
    notifyListeners();
  }

  Widget _widget;
  Widget get widget => _widget;

  CartRidge _selectedCartridge;
  CartRidge get selectedCartridge => _selectedCartridge;
  void selectCartridge(CartRidge cartRidge) {
    _selectedCartridge = cartRidge;
  }

  bool _hasLoadedCartridge = false;
  bool get hasLoadedCartridge => _hasLoadedCartridge;

  void loadCartridge(CartRidge cartridge) async {
    if (hasLoadedCartridge) return;

    print('[loadCartridge] ${cartridge.name}');
    // TODO: Bug
    // _audioPlayer.open(
    //   Audio(Assets.GAMEBOY_ADVANCE_SP_CARTRIDGE_INSERT),
    // );

    _widget = BootupScreen(
      onFinish: () => _onBootupFinish(cartridge.widget),
    );
    notifyListeners();
  }

  void unloadCartridge() {
    // _audioPlayer.open(
    //   Audio(Assets.GAMEBOY_ADVANCE_SP_CARTRIDGE_REMOVE),
    // );

    // TODO: Remove this hardcoded code, when provider is no longer a singleton
    MusicPlayerProvider().unload();

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

enum SystemBrightness { LIGHT, LIGHTEST }
