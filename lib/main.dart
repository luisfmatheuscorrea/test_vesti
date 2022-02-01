import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/helpers/http_override.dart';
import 'package:test_zummedy/splash.dart';

void startEnv() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
      home: FutureBuilder<Widget>(
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(home: Splash());
          } else {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return Container();
            }
          }
        },
        future: _mainWidget(),
      ),
    );
  }

  Future<Widget> _mainWidget() async {
    return Splash();
  }
}
