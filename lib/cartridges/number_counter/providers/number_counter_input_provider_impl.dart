import 'package:flutter_gameboy_advance_sp/cartridges/number_counter/providers/number_counter_provider.dart';

import '../../../providers/system_input_provider.dart';

class NumberCounterInputProviderImpl implements SystemInputProvider {
  NumberCounterProvider _counterProvider = NumberCounterProvider();

  @override
  void onActionATap() {
    _counterProvider.increment();
  }

  @override
  void onActionBTap() {
    _counterProvider.decrement();
  }

  @override
  void onDirectionalUpTap() {}

  @override
  void onDirectionalDownTap() {}

  @override
  void onDirectionalLeftTap() {}

  @override
  void onDirectionalRightTap() {}

  @override
  void onMenuTap() {}

  @override
  void onSelectTap() {}

  @override
  void onShoulderLeftTap() {}

  @override
  void onShoulderRightTap() {}

  @override
  void onStartTap() {}

  @override
  void onStartLongPress() {}

  @override
  void onActionALongPress() {}

  @override
  void onActionBLongPress() {}

  @override
  void onDirectionalDownLongPress() {}

  @override
  void onDirectionalLeftLongPress() {}

  @override
  void onDirectionalRightLongPress() {}

  @override
  void onDirectionalUpLongPress() {}

  @override
  void onMenuLongPress() {}

  @override
  void onSelectLongPress() {}

  @override
  void onShoulderLeftLongPress() {}

  @override
  void onShoulderRightLongPress() {}
}
