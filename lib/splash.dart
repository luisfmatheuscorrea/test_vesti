import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_zummedy/app_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/settings/controllers/company/company_controller.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final controller = GetIt.I.get<CompanyController>();

  @override
  void initState() {
    controller.getCompany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000))
        .then((_) => goTo(context));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text(
          'Zummedy',
          style: AppTextStyles.zummedyText,
        ),
      ),
    );
  }

  void goTo(context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AppWidget()),
    );
  }
}
