// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SizeController on _SizeControllerBase, Store {
  final _$sizeSelectedAtom = Atom(name: '_SizeControllerBase.sizeSelected');

  @override
  int get sizeSelected {
    _$sizeSelectedAtom.reportRead();
    return super.sizeSelected;
  }

  @override
  set sizeSelected(int value) {
    _$sizeSelectedAtom.reportWrite(value, super.sizeSelected, () {
      super.sizeSelected = value;
    });
  }

  final _$_SizeControllerBaseActionController =
      ActionController(name: '_SizeControllerBase');

  @override
  dynamic selectSize(int size) {
    final _$actionInfo = _$_SizeControllerBaseActionController.startAction(
        name: '_SizeControllerBase.selectSize');
    try {
      return super.selectSize(size);
    } finally {
      _$_SizeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sizeSelected: ${sizeSelected}
    ''';
  }
}
