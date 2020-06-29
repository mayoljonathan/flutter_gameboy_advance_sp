import '../config/inputs.dart';
import '../models/input.dart';
import '../system.dart';
import 'system_input_provider.dart';

class SystemInputProviderImpl {
  const SystemInputProviderImpl(this.inputProvider);
  final SystemInputProvider inputProvider;

  void onTap(Input input) {
    if (!System().hasLoadedCartridge) return;

    switch (input.id) {
      case Inputs.D_UP:
        print('[System - onTap] Directional Up');
        this.inputProvider.onDirectionalUpTap();
        break;
      case Inputs.D_LEFT:
        print('[System - onTap] Directional Left');
        this.inputProvider.onDirectionalLeftTap();
        break;
      case Inputs.D_RIGHT:
        print('[System - onTap] Directional Right');
        this.inputProvider.onDirectionalRightTap();
        break;
      case Inputs.D_DOWN:
        print('[System - onTap] Directional Down');
        this.inputProvider.onDirectionalDownTap();
        break;
      case Inputs.B_BUTTON:
        print('[System - onTap] B Button');
        this.inputProvider.onActionBTap();
        break;
      case Inputs.A_BUTTON:
        print('[System - onTap] A Button');
        this.inputProvider.onActionATap();
        break;
      case Inputs.S_LEFT:
        print('[System - onTap] Shoulder Left Button');
        this.inputProvider.onShoulderLeftTap();
        break;
      case Inputs.S_RIGHT:
        print('[System - onTap] Shoulder Right Button');
        this.inputProvider.onShoulderRightTap();
        break;
      case Inputs.MENU:
        print('[System - onTap] Menu Button');
        this.inputProvider.onMenuTap();
        System().toggleBrightness();
        break;
      case Inputs.SELECT:
        print('[System - onTap] Select Button');
        this.inputProvider.onSelectTap();
        break;
      case Inputs.START:
        print('[System - onTap] Start Button');
        this.inputProvider.onStartTap();
        break;
    }
  }

  void onLongPress(Input input) {
    if (!System().hasLoadedCartridge) return;

    switch (input.id) {
      case Inputs.D_UP:
        print('[System - onLongPress] Directional Up');
        this.inputProvider.onDirectionalUpLongPress();
        break;
      case Inputs.D_LEFT:
        print('[System - onLongPress] Directional Left');
        this.inputProvider.onDirectionalLeftLongPress();
        break;
      case Inputs.D_RIGHT:
        print('[System - onLongPress] Directional Right');
        this.inputProvider.onDirectionalRightLongPress();
        break;
      case Inputs.D_DOWN:
        print('[System - onLongPress] Directional Down');
        this.inputProvider.onDirectionalDownLongPress();
        break;
      case Inputs.B_BUTTON:
        print('[System - onLongPress] B Button');
        this.inputProvider.onActionBLongPress();
        break;
      case Inputs.A_BUTTON:
        print('[System - onLongPress] A Button');
        this.inputProvider.onActionALongPress();
        break;
      case Inputs.S_LEFT:
        print('[System - onLongPress] Shoulder Left Button');
        this.inputProvider.onShoulderLeftLongPress();
        break;
      case Inputs.S_RIGHT:
        print('[System - onLongPress] Shoulder Right Button');
        this.inputProvider.onShoulderRightLongPress();
        break;
      case Inputs.MENU:
        print('[System - onLongPress] Menu Button');
        this.inputProvider.onMenuLongPress();
        break;
      case Inputs.SELECT:
        print('[System - onLongPress] Select Button');
        this.inputProvider.onSelectLongPress();
        break;
      case Inputs.START:
        print('[System - onLongPress] Start Button');
        this.inputProvider.onStartLongPress();
        break;
    }
  }
}
