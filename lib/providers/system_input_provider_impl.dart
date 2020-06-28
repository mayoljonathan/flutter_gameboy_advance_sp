import '../config/inputs.dart';
import '../models/input.dart';
import 'system_input_provider.dart';

class SystemInputProviderImpl {
  const SystemInputProviderImpl(this.inputProvider);
  final SystemInputProvider inputProvider;

  void onTap(Input input) {
    switch (input.id) {
      case Inputs.D_UP:
        print('[System] Directional Up');
        this.inputProvider.onDirectionalUpTap();
        break;
      case Inputs.D_LEFT:
        print('[System] Directional Left');
        this.inputProvider.onDirectionalLeftTap();
        break;
      case Inputs.D_RIGHT:
        print('[System] Directional Right');
        this.inputProvider.onDirectionalRightTap();
        break;
      case Inputs.D_DOWN:
        print('[System] Directional Down');
        this.inputProvider.onDirectionalDownTap();
        break;
      case Inputs.B_BUTTON:
        print('[System] B Button');
        this.inputProvider.onActionBTap();
        break;
      case Inputs.A_BUTTON:
        print('[System] A Button');
        this.inputProvider.onActionATap();
        break;
      case Inputs.S_LEFT:
        print('[System] Shoulder Left Button');
        this.inputProvider.onShoulderLeftTap();
        break;
      case Inputs.S_RIGHT:
        print('[System] Shoulder Right Button');
        this.inputProvider.onShoulderRightTap();
        break;
      case Inputs.MENU:
        print('[System] Menu Button');
        this.inputProvider.onMenuTap();
        break;
      case Inputs.SELECT:
        print('[System] Select Button');
        this.inputProvider.onSelectTap();
        break;
      case Inputs.START:
        print('[System] Start Button');
        this.inputProvider.onStartTap();
        break;
    }
  }
}
