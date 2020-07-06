import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../system.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Selector<System, SystemBrightness>(
        selector: (_, System model) => model.brightness,
        builder: (_, SystemBrightness brightness, Widget child) {
          double opacity = 0.3;
          if (brightness == SystemBrightness.LIGHTEST) {
            opacity = 0;
          }
          return ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Stack(
                children: [
                  child,
                  Container(
                    color: Colors.black.withOpacity(opacity),
                  ),
                ],
              ),
            ),
          );
        },
        child: Selector<System, Widget>(
          selector: (_, model) => model.widget,
          builder: (_, Widget widget, Widget child) => widget ?? child,
          child: Container(color: Colors.black),
        ),
      ),
    );
  }
}
