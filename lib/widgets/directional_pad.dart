import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/directional_button.dart';
import '../config/inputs.dart';
import '../models/input.dart';

class DirectionalPad extends StatelessWidget {
  final double _size = 160;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size,
      width: _size,
      color: kReleaseMode ? Colors.transparent : Colors.red.withOpacity(0.5),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: DirectionalButton(input: Input(Inputs.D_UP)),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DirectionalButton(input: Input(Inputs.D_LEFT)),
                DirectionalButton(input: Input(Inputs.D_RIGHT)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DirectionalButton(input: Input(Inputs.D_DOWN)),
          ),
        ],
      ),
    );
  }
}
