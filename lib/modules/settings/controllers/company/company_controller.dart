import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';
import 'package:test_zummedy/modules/settings/models/company_model.dart';

part 'company_controller.g.dart';

class CompanyController = _CompanyControllerBase with _$CompanyController;

abstract class _CompanyControllerBase with Store {
  final LocalStorage storage = LocalStorage('app_storage');

  @observable
  Company? company;

  @observable
  String name = '';

  @observable
  bool invalid = false;

  // _CompanyControllerBase({}) {}

  @action
  changeName(String value) {
    if (value.isEmpty) {
      invalid = true;
    } else {
      invalid = false;
      name = value;
    }
  }

  @action
  createCompany() async {
    if (name.isEmpty) {
      invalid = true;
      return false;
    } else {
      if (await storage.ready) {
        company = Company(name: name);
        storage.setItem('company', Company(name: name).toJson());
        return true;
      }
    }
  }

  @action
  getCompany() async {
    if (await storage.ready) {
      company = Company.fromJson(storage.getItem('company'));
    }
  }
}
