import 'package:mobx/mobx.dart';

part 'carousel_image_controller.g.dart';

class CarouselImageController = _CarouselImageControllerBase
    with _$CarouselImageController;

abstract class _CarouselImageControllerBase with Store {
  @observable
  int currentSlide = 0;

  // _CarouselImageControllerBase({}) {}

  @action
  onPageChanged(int index) {
    currentSlide = index;
  }
}
