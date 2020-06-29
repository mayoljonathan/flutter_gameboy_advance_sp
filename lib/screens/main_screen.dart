import 'package:flutter/material.dart';
import 'package:flutter_gameboy_advance_sp/system.dart';
import 'package:flutter_gameboy_advance_sp/widgets/cartridge_chooser.dart';

import '../widgets/input_overlay.dart';
import '../config/assets.dart';
import 'display_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final double _sensivity = 1.5;
  bool _showCartridgeChooser = true;

  System _system = System();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cartridgeChooserHeight = (size.height * 0.38);

    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              if (details.delta.dy > _sensivity) {
                _system.loadCartridge(_system.selectedCartridge);
                setState(() => _showCartridgeChooser = false);
              } else if (details.delta.dy < -_sensivity) {
                _system.unloadCartridge();
                setState(() => _showCartridgeChooser = true);
              }
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: cartridgeChooserHeight,
                    child: CartRidgeChooser(),
                  ),
                ),
                AnimatedPositioned(
                  bottom: _showCartridgeChooser ? cartridgeChooserHeight : 0,
                  height: size.height,
                  width: size.width,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(Assets.GAMEBOY_ADVANCE_SP_SKIN),
                      ),
                      DisplayScreen(),
                      InputOverlay(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
