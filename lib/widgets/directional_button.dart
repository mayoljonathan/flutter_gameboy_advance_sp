import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/input.dart';
import '../providers/system_input_provider_impl.dart';

class DirectionalButton extends StatelessWidget {
  const DirectionalButton({Key key, @required this.input}) : super(key: key);

  final Input input;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SystemInputProviderImpl>().onTap(input),
      onLongPress: () => context.read<SystemInputProviderImpl>().onLongPress(input),
      child: Container(
        color: kReleaseMode ? Colors.transparent : Colors.yellow.withOpacity(0.3),
        height: 55,
        width: 55,
      ),
    );
  }
}
