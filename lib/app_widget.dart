import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_zummedy/components/navigation_bar/navigation_bar.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';
import 'package:test_zummedy/modules/catalog/catalog_page.dart';
import 'package:test_zummedy/modules/settings/controllers/company/company_controller.dart';
import 'package:test_zummedy/modules/settings/company_settings_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _telas = [];

  final cartController = GetIt.I.get<CartController>();
  final companyController = GetIt.I.get<CompanyController>();

  @override
  void initState() {
    _buildPages();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            companyController.company!.name,
            style: AppTextStyles.zummedyText,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompanySettingsPage(),
                  ),
                );
              },
              color: AppColors.unselectedTitle,
              icon: const ImageIcon(
                AssetImage('assets/images/icons/settings.png'),
              ),
            )
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _telas,
        ),
        bottomNavigationBar: const NavigationBar(),
      ),
    );
  }

  void _buildPages() {
    _telas.addAll([
      CatalogPage(
        pageController: _pageController,
      ),
    ]);
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {});
  }
}
