import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../config/assets.dart';
import '../system.dart';
import '../widgets/cartridge_chooser.dart';
import '../widgets/input_overlay.dart';
import 'display_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final double _gameboyImageFileHeight = 1334;
  final double _sensivity = 1.5;
  bool _showCartridgeChooser = true;

  System _system = System();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cartridgeChooserHeight = (size.height * 0.38);

    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: true,
    );

    Widget child = Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
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
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
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
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Assets.GAMEBOY_ADVANCE_SP_SKIN,
                    alignment: Alignment.center,
                    height: size.height,
                  ),
                  Positioned(
                    top: 128.h,
                    child: Container(
                      height: 610.h,
                      margin: EdgeInsets.only(right: 10.h),
                      child: DisplayScreen(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: size.height / 2,
                    child: InputOverlay(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if ((size.height / size.width) >= 1.78 || (size.height > _gameboyImageFileHeight)) {
      child = _buildUnsupportedSize();
    }

    return Material(
      color: Colors.black,
      child: child,
    );
  }

  Widget _buildUnsupportedSize() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          'Unsupported screen size.',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(30),
          ),
        ),
      ),
    );
  }
}
