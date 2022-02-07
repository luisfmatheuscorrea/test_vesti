import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:test_zummedy/components/card_product/card_product_widget.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/catalog/controllers/category/category_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/product/product_controller.dart';

class GridProducts extends StatefulWidget {
  const GridProducts({
    Key? key,
  }) : super(key: key);

  @override
  _GridProductsState createState() => _GridProductsState();
}

class _GridProductsState extends State<GridProducts> {
  final productController = GetIt.I.get<ProductController>();
  final categoryController = GetIt.I.get<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (productController.state == ProductState.success) {
        return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.81,
          children: List.generate(
            productController.products.length,
            (index) => CardProductWidget(
              product: productController.products[index],
            ),
          ),
        );
      } else if (productController.state == ProductState.empty) {
        return Expanded(
          child: Center(
            child: Text(
              'O catálogo está vazio. Volte mais tarde!',
              style: AppTextStyles.textLoading,
            ),
          ),
        );
      } else if (productController.state == ProductState.fail) {
        return Expanded(
          child: Center(
            child: Text(
              'Ocorreu um erro ao carregar o catálogo, tente novamente mais tarde!',
              style: AppTextStyles.textLoading,
            ),
          ),
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
                  'Carregando Produtos...',
                  style: AppTextStyles.textLoading,
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
