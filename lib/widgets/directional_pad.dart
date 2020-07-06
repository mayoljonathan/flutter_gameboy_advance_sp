import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../config/inputs.dart';
import '../models/input.dart';
import '../widgets/directional_button.dart';

class DirectionalPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365.h,
      width: 360.h,
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
