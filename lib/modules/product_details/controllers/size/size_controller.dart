import 'package:mobx/mobx.dart';

part 'size_controller.g.dart';

class SizeController = _SizeControllerBase with _$SizeController;

abstract class _SizeControllerBase with Store {
  @observable
  int sizeSelected = 4;

  // _SizeControllerBase({}) {}

  @action
  selectSize(int size) {
    sizeSelected = size;
  }
}
