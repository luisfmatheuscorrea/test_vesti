import 'package:mobx/mobx.dart';
import 'package:test_zummedy/modules/cart/models/cart_product_model.dart';
import 'package:test_zummedy/modules/catalog/models/product/product_model.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

enum Amount { add, remove }

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<CartProduct> cartProducts = ObservableList.of([]);

  // _CartControllerBase({}) {}

  @action
  addProduct(Product product) {
    if (cartProducts.indexWhere(
            (cartProduct) => cartProduct.product.id == product.id) ==
        -1) {
      cartProducts.add(CartProduct(product: product, amount: 1));
    } else {
      changeAmount(Amount.add, product);
    }
  }

  @action
  removeProduct(Product product) {
    cartProducts
        .removeWhere((cartProduct) => cartProduct.product.id == product.id);
  }

  @action
  changeAmount(Amount amount, Product product) {
    if (amount == Amount.add) {
      int indexCartProduct = cartProducts
          .indexWhere((cartProduct) => cartProduct.product.id == product.id);

      if (indexCartProduct != -1) {
        CartProduct cartProduct = cartProducts
            .firstWhere((cartProduct) => cartProduct.product.id == product.id);
        cartProducts
            .removeWhere((cartProduct) => cartProduct.product.id == product.id);

        cartProducts.add(CartProduct(
            product: cartProduct.product, amount: cartProduct.amount + 1));
      } else {
        addProduct(product);
      }
    } else {
      CartProduct cartProduct = cartProducts
          .firstWhere((cartProduct) => cartProduct.product.id == product.id);
      cartProducts
          .removeWhere((cartProduct) => cartProduct.product.id == product.id);

      if (cartProduct.amount > 1) {
        cartProducts.add(CartProduct(
            product: cartProduct.product, amount: cartProduct.amount - 1));
      }
    }
  }
}
