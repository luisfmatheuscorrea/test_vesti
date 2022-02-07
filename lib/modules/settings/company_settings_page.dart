import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:test_zummedy/app_widget.dart';
import 'package:test_zummedy/components/button_widget/button_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/settings/controllers/company/company_controller.dart';

class CompanySettingsPage extends StatefulWidget {
  const CompanySettingsPage({Key? key}) : super(key: key);

  @override
  _CompanySettingsPageState createState() => _CompanySettingsPageState();
}

class _CompanySettingsPageState extends State<CompanySettingsPage> {
  final controller = TextEditingController();
  final settingsController = GetIt.I.get<CompanyController>();

  @override
  void initState() {
    controller.text = settingsController.company!.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: deviceWidth * 0.05),
              child: Text(
                'Configurações',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: AppTextStyles.titleProductDetails,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.05, vertical: deviceWidth * 0.05),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.borderBase),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  errorText: settingsController.invalid
                      ? 'Esse campo é obrigatório'
                      : null,
                ),
                onChanged: (value) {
                  settingsController.changeName(value);
                },
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            ButtonWidget(
              text: 'Salvar',
              onTap: () async {
                settingsController.createCompany().then((res) {
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
