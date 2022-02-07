import 'package:mobx/mobx.dart';

part 'color_select_controller.g.dart';

class ColorSelectController = _ColorSelectControllerBase
    with _$ColorSelectController;

abstract class _ColorSelectControllerBase with Store {
  @observable
  int colorSelected = 0;

  // _ColorSelectControllerBase({}) {}

  @action
  selectColor(int index) {
    colorSelected = index;
  }
}
