import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:test_zummedy/components/card_product/card_product_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/helpers/text_helper.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';
import 'package:test_zummedy/modules/catalog/components/grid_products.dart';
import 'package:test_zummedy/modules/catalog/controllers/category/category_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/product/product_controller.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    Key? key,
    required this.pageController,
    required this.cartController,
  }) : super(key: key);

  final PageController pageController;
  final CartController cartController;

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage>
    with SingleTickerProviderStateMixin {
  CategoryController categoryController = CategoryController();
  ProductController productController = ProductController();
  late TabController tabController;

  @override
  void initState() {
    categoryController.getAllCategories();
    productController.getAllProducts();
    tabController = TabController(vsync: this, length: 5);

    tabController.addListener(() {
      categoryController.onChangeCategory(tabController.index);
      if (tabController.index != 0) {
        productController.onChangeCategory(
            categoryController.categories[tabController.index - 1]);
      } else {
        productController.getAllProducts();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Observer(
        builder: (context) {
          if (categoryController.state == CategoryState.fail) {
            return Expanded(
              child: Center(
                child: Text(
                  'Ocorreu um erro ao carregar o catálogo, tente novamente mais tarde!',
                  style: AppTextStyles.textLoading,
                ),
              ),
            );
          } else if (categoryController.state == CategoryState.empty) {
            return Expanded(
              child: Center(
                child: Text(
                  'O catálogo está vazio. Volte mais tarde!',
                  style: AppTextStyles.textLoading,
                ),
              ),
            );
          } else if (categoryController.state == CategoryState.success) {
            return DefaultTabController(
              length: categoryController.categories.length + 1,
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
                    onTap: (value) {
                      if (value == 0) {
                        productController.getAllProducts();
                      } else {
                        productController.onChangeCategory(
                            categoryController.categories[value - 1]);
                      }
                    },
                    tabs: List.generate(
                      categoryController.categories.length + 1,
                      (index) {
                        if (index == 0) {
                          return const Tab(
                            text: 'New arrivals',
                          );
                        }
                        return Tab(
                          text: TextHelper.capitalize(
                              categoryController.categories[index - 1].name),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.74,
                  child: TabBarView(
                    controller: tabController,
                    children: List.generate(
                      categoryController.categories.length + 1,
                      (index) {
                        return GridProducts(
                          productController: productController,
                          categoryController: categoryController,
                          cartController: widget.cartController,
                        );
                      },
                    ),
                  ),
                ),
              ]),
            );
          } else {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                      height: MediaQuery.of(context).size.width * 0.08,
                      child: const CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Carregando Catálogo...',
                      style: AppTextStyles.textLoading,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
