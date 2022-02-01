import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_zummedy/app_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000))
        .then((_) => goToApp(context));
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

  void goToApp(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AppWidget()),
    );
  }
}
