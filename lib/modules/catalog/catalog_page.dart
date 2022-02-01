import 'package:flutter/material.dart';
import 'package:test_zummedy/core/app_colors.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 5,
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppColors.borderBase,
                  width: 1.5,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 1),
            child: TabBar(
              labelColor: AppColors.black,
              unselectedLabelColor: AppColors.unselectedTitle,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(
                  text: 'New arrivals',
                ),
                Tab(
                  text: 'Eletronics',
                ),
                Tab(
                  text: 'Jewelery',
                ),
                Tab(
                  text: "Men's",
                ),
                Tab(
                  text: "Women's",
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.74,
            child: const TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
