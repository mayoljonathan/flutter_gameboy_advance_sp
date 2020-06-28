import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../system.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 57.5,
        left: 35.0,
        right: 39.0,
      ),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) => Selector<System, Widget>(
              selector: (_, model) => model.widget,
              builder: (_, Widget widget, Widget child) => widget ?? child,
              child: Container(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
