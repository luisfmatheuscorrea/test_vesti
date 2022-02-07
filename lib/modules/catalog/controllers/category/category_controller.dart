import 'package:mobx/mobx.dart';
import 'package:test_zummedy/modules/catalog/models/category/category_model.dart';
import 'package:test_zummedy/modules/catalog/repositories/category_repository.dart';

part 'category_controller.g.dart';

enum CategoryState { initial, loading, empty, success, fail }

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  @observable
  List<Category> categories = [];

  @observable
  CategoryState state = CategoryState.initial;

  @observable
  Category? actualCategory;

  // _CategoryControllerBase({}) {}

  @action
  onChangeCategory(int index) {
    if (index != 0) {
      actualCategory = categories[index - 1];
    }
  }

  @action
  getAllCategories() async {
    CategoryRepository().getAllCategories().then((resp) {
      if (resp.isNotEmpty) {
        categories = resp;
        state = CategoryState.success;
      } else {
        categories = resp;
        state = CategoryState.empty;
      }
      // ignore: argument_type_not_assignable_to_error_handler
    }).catchError(() {
      state = CategoryState.fail;
    });
  }
}
