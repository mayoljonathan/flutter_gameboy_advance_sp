import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import '../models/input.dart';
import '../providers/system_input_provider_impl.dart';

class ShoulderButton extends StatelessWidget {
  const ShoulderButton({Key key, @required this.input}) : super(key: key);

  final Input input;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SystemInputProviderImpl>().onTap(input),
      onLongPress: () => context.read<SystemInputProviderImpl>().onLongPress(input),
      child: Container(
        color: kReleaseMode ? Colors.transparent : Colors.yellow.withOpacity(0.3),
        width: 155.h,
        height: 98.h,
      ),
    );
  }
}
