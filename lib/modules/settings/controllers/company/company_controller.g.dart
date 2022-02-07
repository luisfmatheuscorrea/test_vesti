// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyController on _CompanyControllerBase, Store {
  final _$companyAtom = Atom(name: '_CompanyControllerBase.company');

  @override
  Company? get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(Company? value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  final _$nameAtom = Atom(name: '_CompanyControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$invalidAtom = Atom(name: '_CompanyControllerBase.invalid');

  @override
  bool get invalid {
    _$invalidAtom.reportRead();
    return super.invalid;
  }

  @override
  set invalid(bool value) {
    _$invalidAtom.reportWrite(value, super.invalid, () {
      super.invalid = value;
    });
  }

  final _$createCompanyAsyncAction =
      AsyncAction('_CompanyControllerBase.createCompany');

  @override
  Future createCompany() {
    return _$createCompanyAsyncAction.run(() => super.createCompany());
  }

  final _$getCompanyAsyncAction =
      AsyncAction('_CompanyControllerBase.getCompany');

  @override
  Future getCompany() {
    return _$getCompanyAsyncAction.run(() => super.getCompany());
  }

  final _$_CompanyControllerBaseActionController =
      ActionController(name: '_CompanyControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_CompanyControllerBaseActionController.startAction(
        name: '_CompanyControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_CompanyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
company: ${company},
name: ${name},
invalid: ${invalid}
    ''';
  }
}
