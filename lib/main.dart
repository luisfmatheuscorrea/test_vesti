import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';
import 'package:test_zummedy/app_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/helpers/http_override.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/category/category_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/product/product_controller.dart';
import 'package:test_zummedy/modules/settings/controllers/company/company_controller.dart';
import 'package:test_zummedy/welcome_page.dart';
import 'package:test_zummedy/splash.dart';

void startEnv() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<CartController>(CartController());
  getIt.registerSingleton<ProductController>(ProductController());
  getIt.registerSingleton<CategoryController>(CategoryController());
  getIt.registerSingleton<CompanyController>(CompanyController());
}

void main() async {
  startEnv();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalStorage storage = LocalStorage('app_storage');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zummedy',
      theme: ThemeData(
        highlightColor: AppColors.primary.withOpacity(.2),
        splashColor: AppColors.primary.withOpacity(.3),
        canvasColor: AppColors.white,
        primarySwatch: AppColors.primaryMaterial,
        backgroundColor: AppColors.white,
      ),
      home: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == true) {
            if (storage.getItem('company') != null) {
              return Splash();
            } else {
              return WelcomePage();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }

  // Future<Widget> _mainWidget() async {
  //   return Splash();
  // }
}
