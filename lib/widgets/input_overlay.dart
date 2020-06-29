import 'package:flutter/material.dart';

import '../widgets/action_buttons_pad.dart';
import '../widgets/circle_button.dart';
import '../widgets/directional_pad.dart';
import '../widgets/shoulder_button.dart';
import '../config/inputs.dart';
import '../models/input.dart';

class InputOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Stack(
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
              alignment: FractionalOffset(0.5, 0.067),
              child: CircleButton(
                size: 30,
                input: Input(Inputs.MENU),
              ),
            ),
            Align(
              alignment: FractionalOffset(0.113, 0.422),
              child: DirectionalPad(),
            ),
            Align(
              alignment: FractionalOffset(0.881, 0.445),
              child: ActionButtonsPad(),
            ),
            Align(
              alignment: FractionalOffset(0.42, 0.976),
              child: CircleButton(
                size: 40,
                input: Input(Inputs.SELECT),
              ),
            ),
            Align(
              alignment: FractionalOffset(0.582, 0.976),
              child: CircleButton(
                size: 40,
                input: Input(Inputs.START),
              ),
            )
          ],
        ),
      ),
    );
  }
}
