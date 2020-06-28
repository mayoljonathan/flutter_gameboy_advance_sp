import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/inputs.dart';
import '../models/input.dart';
import 'circle_button.dart';

class ActionButtonsPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 140,
      color: kReleaseMode ? Colors.transparent : Colors.red.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleButton(
              input: Input(Inputs.B_BUTTON),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleButton(
              input: Input(Inputs.A_BUTTON),
            ),
          ),
        ],
      ),
    );
  }
}
