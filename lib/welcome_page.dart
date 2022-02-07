import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_zummedy/app_widget.dart';
import 'package:test_zummedy/components/button_widget/button_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/settings/controllers/company/company_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = TextEditingController();
  final companyController = GetIt.I.get<CompanyController>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Olá, seja bem vindo!',
                  style: AppTextStyles.titleSettings,
                ),
                Text(
                  'Para começar defina o nome da sua empresa',
                  style: AppTextStyles.selectedTabText,
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            Observer(
              builder: (context) => TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: AppColors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: AppColors.black,
                    ),
                  ),
                  labelStyle: AppTextStyles.characteristic,
                  labelText: 'Nome da Empresa',
                  errorText: companyController.invalid
                      ? 'Esse campo é obrigatório'
                      : null,
                ),
                onChanged: (value) {
                  companyController.changeName(value);
                },
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            ButtonWidget(
              text: 'Finalizar',
              onTap: () async {
                companyController.createCompany().then((res) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppWidget(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
