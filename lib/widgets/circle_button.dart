import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/input.dart';
import '../providers/system_input_provider_impl.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
    @required this.input,
    this.size = 55,
  });

  final Input input;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SystemInputProviderImpl>().onTap(input),
      onLongPress: () => context.read<SystemInputProviderImpl>().onLongPress(input),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kReleaseMode ? Colors.transparent : Colors.yellow.withOpacity(0.3),
        ),
        height: size,
        width: size,
      ),
    );
  }
}
