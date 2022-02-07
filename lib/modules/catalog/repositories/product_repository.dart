import 'package:test_zummedy/helpers/config.dart';
import 'package:test_zummedy/helpers/connector.dart';
import 'package:test_zummedy/modules/catalog/models/category/category_model.dart';
import 'package:test_zummedy/modules/catalog/models/product/product_model.dart';

class ProductRepository {
  final Connector _connector = Connector(baseURL: DefaultURL.apiURL());

  Future<List<Product>> getAllProducts() async {
    final resp = await _connector.getContent('/products');

    if (resp.responseCode! < 400) {
      List respList = resp.returnObject;
      List<Product> products = [];

      for (var json in respList) {
        products.add(Product.fromJson(json));
      }

      return products;
    }

    return resp.returnObject;
  }

  Future<List<Product>> getByCategory(Category category) async {
    final resp =
        await _connector.getContent('/products/category/${category.name}');

    if (resp.responseCode! < 400) {
      List respList = resp.returnObject;
      List<Product> products = [];

      for (var json in respList) {
        products.add(Product.fromJson(json));
      }

      return products;
    }

    return resp.returnObject;
  }

  Future<Product> getById(int productId) async {
    final resp = await _connector.getContent('/products/$productId');

    if (resp.responseCode! < 400) {
      return Product.fromJson(resp.returnObject);
    }

    return resp.returnObject;
  }
}
