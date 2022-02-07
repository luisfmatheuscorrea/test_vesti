// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  final _$categoriesAtom = Atom(name: '_CategoryControllerBase.categories');

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$stateAtom = Atom(name: '_CategoryControllerBase.state');

  @override
  CategoryState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CategoryState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$actualCategoryAtom =
      Atom(name: '_CategoryControllerBase.actualCategory');

  @override
  Category? get actualCategory {
    _$actualCategoryAtom.reportRead();
    return super.actualCategory;
  }

  @override
  set actualCategory(Category? value) {
    _$actualCategoryAtom.reportWrite(value, super.actualCategory, () {
      super.actualCategory = value;
    });
  }

  final _$getAllCategoriesAsyncAction =
      AsyncAction('_CategoryControllerBase.getAllCategories');

  @override
  Future getAllCategories() {
    return _$getAllCategoriesAsyncAction.run(() => super.getAllCategories());
  }

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  dynamic onChangeCategory(int index) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.onChangeCategory');
    try {
      return super.onChangeCategory(index);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
state: ${state},
actualCategory: ${actualCategory}
    ''';
  }
}
