import 'package:mobx/mobx.dart';
import 'package:test_zummedy/modules/catalog/models/category/category_model.dart';
import 'package:test_zummedy/modules/catalog/models/product/product_model.dart';
import 'package:test_zummedy/modules/catalog/repositories/product_repository.dart';

part 'product_controller.g.dart';

enum ProductState { initial, loading, empty, success, fail }

class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  @observable
  List<Product> products = [];

  @observable
  Product? selectedProduct;

  @observable
  ProductState state = ProductState.initial;

  // _ProductControllerBase({}) {}

  @action
  onChangeCategory(Category category) {
    state = ProductState.initial;
    ProductRepository().getByCategory(category).then((resp) {
      if (resp.isNotEmpty) {
        products = resp;
        state = ProductState.success;
      } else {
        products = resp;
        state = ProductState.empty;
      }
      // ignore: argument_type_not_assignable_to_error_handler
    }).catchError(() {
      state = ProductState.fail;
    });
  }

  @action
  getAllProducts() async {
    state = ProductState.initial;
    ProductRepository().getAllProducts().then((resp) {
      if (resp.isNotEmpty) {
        products = resp;
        state = ProductState.success;
      } else {
        products = resp;
        state = ProductState.empty;
      }
      // ignore: argument_type_not_assignable_to_error_handler
    }).catchError(() {
      state = ProductState.fail;
    });
  }

  @action
  selectProduct(int productId) async {
    ProductRepository().getById(productId).then((resp) {
      selectedProduct = resp;
      state = ProductState.success;
      // ignore: argument_type_not_assignable_to_error_handler
    }).catchError(() {
      state = ProductState.fail;
    });
  }
}
