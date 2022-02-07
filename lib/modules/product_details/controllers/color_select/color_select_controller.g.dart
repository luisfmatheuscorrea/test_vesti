// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_select_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorSelectController on _ColorSelectControllerBase, Store {
  final _$colorSelectedAtom =
      Atom(name: '_ColorSelectControllerBase.colorSelected');

  @override
  int get colorSelected {
    _$colorSelectedAtom.reportRead();
    return super.colorSelected;
  }

  @override
  set colorSelected(int value) {
    _$colorSelectedAtom.reportWrite(value, super.colorSelected, () {
      super.colorSelected = value;
    });
  }

  final _$_ColorSelectControllerBaseActionController =
      ActionController(name: '_ColorSelectControllerBase');

  @override
  dynamic selectColor(int index) {
    final _$actionInfo = _$_ColorSelectControllerBaseActionController
        .startAction(name: '_ColorSelectControllerBase.selectColor');
    try {
      return super.selectColor(index);
    } finally {
      _$_ColorSelectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
colorSelected: ${colorSelected}
    ''';
  }
}
