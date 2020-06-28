import 'package:flutter/material.dart';

import '../widgets/input_overlay.dart';
import '../config/assets.dart';
import 'display_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          Image(
            image: AssetImage(Assets.GAMEBOY_ADVANCE_SP_SKIN),
          ),
          DisplayScreen(),
          InputOverlay()
        ],
      ),
    );
  }
}
