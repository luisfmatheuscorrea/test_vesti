import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_zummedy/helpers/return.dart';
import 'config.dart';

class Connector {
  static String? userKey;

  Connector({required this.baseURL});

  Dio dio = Dio();

  final String baseURL;

  void _displayAlert(String title, String msg, BuildContext context) {
    final dialog = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        actions: <Widget>[
          FlatButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        content: Text(msg),
        title: Text(title),
      ),
    );
    showDialog(
        builder: (context) {
          return dialog;
        },
        context: context);
  }

  void handleStatus(int stat, BuildContext context) {
    switch (stat) {
      case 400:
        _displayAlert(stat.toString(), 'Requisição incorreta', context);
        break;
      case 401:
        _displayAlert(stat.toString(), 'Não autorizado', context);
        break;
      case 403:
        _displayAlert(stat.toString(), 'Não autenticado', context);
        break;
      case 404:
        _displayAlert(stat.toString(), 'Não localizado', context);
        break;
      case 500:
        _displayAlert(stat.toString(), 'Erro no servidor', context);
        break;
    }
  }

  Future<Options> getOptionsRequest({String? method}) async {
    Map<String, String> headers = {
      Headers.acceptHeader: 'application/json',
      Headers.contentTypeHeader: 'application/json'
    };

    // Set default configs
    dio.options.baseUrl = baseURL;
    dio.options.connectTimeout = DefaultURL.defaultTimeout();
    dio.options.receiveTimeout = DefaultURL.defaultTimeout();

    Options opts = Options(
      headers: headers,
      method: method == null ? 'GET' : method,
    );

    return opts;
  }

  Future<Return> getContent(String service) async {
    try {
      Options opts = await getOptionsRequest();
      log("Chamando getContent [$service]");
      Response response = await dio.get(service, options: opts);
      log("Finalizando getContent [$service] HTTP CODE ${response.statusCode}");
      return Return(
        responseCode: response.statusCode,
        returnBody: jsonEncode(response.data),
        returnObject: response.data,
      );
    } on DioError catch (e) {
      return Return(
        responseCode: e.response != null ? e.response!.statusCode : 400,
        returnBody: e.response != null ? jsonEncode(e.response!.data) : null,
      );
    } on Exception catch (_) {
      return Return(
        responseCode: 0,
        returnBody: jsonEncode({'message': 'Erro inesperado'}),
      );
    }
  }
}
