// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_image_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarouselImageController on _CarouselImageControllerBase, Store {
  final _$currentSlideAtom =
      Atom(name: '_CarouselImageControllerBase.currentSlide');

  @override
  int get currentSlide {
    _$currentSlideAtom.reportRead();
    return super.currentSlide;
  }

  @override
  set currentSlide(int value) {
    _$currentSlideAtom.reportWrite(value, super.currentSlide, () {
      super.currentSlide = value;
    });
  }

  final _$_CarouselImageControllerBaseActionController =
      ActionController(name: '_CarouselImageControllerBase');

  @override
  dynamic onPageChanged(int index) {
    final _$actionInfo = _$_CarouselImageControllerBaseActionController
        .startAction(name: '_CarouselImageControllerBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$_CarouselImageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSlide: ${currentSlide}
    ''';
  }
}
