import 'package:flutter/material.dart';
import 'package:test_zummedy/components/navigation_bar/navigation_bar.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/catalog/catalog_page.dart';

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
            'Zummedy',
            style: AppTextStyles.zummedyText,
          ),
          actions: [
            IconButton(
              onPressed: () {},
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
        bottomNavigationBar: NavigationBar(),
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
