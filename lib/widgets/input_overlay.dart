import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../config/inputs.dart';
import '../models/input.dart';
import '../widgets/action_buttons_pad.dart';
import '../widgets/circle_button.dart';
import '../widgets/directional_pad.dart';
import '../widgets/shoulder_button.dart';

class InputOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: ShoulderButton(
            input: Input(Inputs.S_LEFT),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShoulderButton(
            input: Input(Inputs.S_RIGHT),
          ),
        ),
        Align(
          alignment: FractionalOffset(0.501, 0.067),
          child: CircleButton(
            size: 65.h,
            input: Input(Inputs.MENU),
          ),
        ),
        Align(
          alignment: FractionalOffset(0.113, 0.425),
          child: DirectionalPad(),
        ),
        Align(
          alignment: FractionalOffset(0.883, 0.442),
          child: ActionButtonsPad(),
        ),
        Align(
          alignment: FractionalOffset(0.42, 0.976),
          child: CircleButton(
            size: 90.h,
            input: Input(Inputs.SELECT),
          ),
        ),
        Align(
          alignment: FractionalOffset(0.582, 0.976),
          child: CircleButton(
            size: 90.h,
            input: Input(Inputs.START),
          ),
        )
      ],
    );
  }
}
