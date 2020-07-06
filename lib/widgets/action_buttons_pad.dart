import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../config/inputs.dart';
import '../models/input.dart';
import 'circle_button.dart';

class ActionButtonsPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205.h,
      width: 320.h,
      color: kReleaseMode ? Colors.transparent : Colors.red.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CircleButton(
              size: 132.h,
              input: Input(Inputs.B_BUTTON),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleButton(
              size: 132.h,
              input: Input(Inputs.A_BUTTON),
            ),
          ),
        ],
      ),
    );
  }
}
