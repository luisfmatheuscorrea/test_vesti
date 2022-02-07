import 'package:test_zummedy/helpers/config.dart';
import 'package:test_zummedy/helpers/connector.dart';
import 'package:test_zummedy/modules/catalog/models/category/category_model.dart';

class CategoryRepository {
  final Connector _connector = Connector(baseURL: DefaultURL.apiURL());

  Future<List<Category>> getAllCategories() async {
    final resp = await _connector.getContent('/products/categories');

    if (resp.responseCode! < 400) {
      List respList = resp.returnObject;
      List<Category> categories = [];

      for (var name in respList) {
        Map<String, dynamic> json = {"name": name};
        categories.add(Category.fromJson(json));
      }

      return categories;
    }

    return resp.returnObject;
  }

  // Future<Product?> getProductById(String productId) async {
  //   final resp = await _connector.getContent('/products/$postId');

  //   if (resp.responseCode! < 400) {
  //     List<dynamic> parsed = jsonDecode(resp.returnBody!);
  //     Map<String, dynamic> postData = jsonDecode(parsed[0]['data']);
  //     final response = await _connector.getContent(
  //         '/api/v1/MyneResourceInformation/findMyneResource/${postData['owner_id']}');
  //     if (response.responseCode! < 400) {
  //       List<dynamic> parsedUser = jsonDecode(response.returnBody!);
  //       Map<String, dynamic> userData = jsonDecode(parsedUser[0]['data']);
  //       int indexProfileImg = (userData['nested'] as List)
  //           .indexWhere((e) => e['type'] == 'PROFILE_IMAGE');
  //       postData['user'] = {
  //         'user': userData,
  //         'profile_image': userData['nested'][indexProfileImg]
  //       };

  //       _loadedProduct = Product.fromJSON(postData);
  //       return _loadedProduct;
  //     }
  //   }
  //   return null;
  // }
}
