// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductControllerBase, Store {
  final _$productsAtom = Atom(name: '_ProductControllerBase.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$selectedProductAtom =
      Atom(name: '_ProductControllerBase.selectedProduct');

  @override
  Product? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(Product? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  final _$stateAtom = Atom(name: '_ProductControllerBase.state');

  @override
  ProductState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProductState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getAllProductsAsyncAction =
      AsyncAction('_ProductControllerBase.getAllProducts');

  @override
  Future getAllProducts() {
    return _$getAllProductsAsyncAction.run(() => super.getAllProducts());
  }

  final _$selectProductAsyncAction =
      AsyncAction('_ProductControllerBase.selectProduct');

  @override
  Future selectProduct(int productId) {
    return _$selectProductAsyncAction.run(() => super.selectProduct(productId));
  }

  final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase');

  @override
  dynamic onChangeCategory(Category category) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.onChangeCategory');
    try {
      return super.onChangeCategory(category);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
selectedProduct: ${selectedProduct},
state: ${state}
    ''';
  }
}
