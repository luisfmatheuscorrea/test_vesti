import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import 'package:test_zummedy/components/button_widget/button_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/product/product_controller.dart';
import 'package:test_zummedy/modules/catalog/models/product/product_model.dart';
import 'package:test_zummedy/modules/product_details/components/carousel_image_product.dart';
import 'package:test_zummedy/modules/product_details/components/color_select_widget.dart';
import 'package:test_zummedy/modules/product_details/components/size_widget.dart';
import 'package:test_zummedy/modules/product_details/controllers/color_select/color_select_controller.dart';
import 'package:test_zummedy/modules/product_details/controllers/size/size_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    Key? key,
    required this.product,
    required this.controller,
    required this.cartController,
  }) : super(key: key);

  final Product product;
  final ProductController controller;
  final CartController cartController;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    widget.controller.selectProduct(widget.product.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeController sizeController = SizeController();
    final ColorSelectController colorSelectController = ColorSelectController();

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    List<Widget> images = [0, 1, 2].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Image.network(
            widget.product.image,
            width: deviceWidth * 0.5,
          );
        },
      );
    }).toList();

    return Observer(
      builder: (context) {
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
                  child: SizedBox(
                    width: deviceWidth * 0.8,
                    child: Text(
                      widget.product.title,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: AppTextStyles.titleProductDetails,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            width: deviceWidth,
            height: deviceHeight,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.borderBase,
                  width: 1.5,
                ),
              ),
            ),
            child: Column(
              children: [
                CarouselImageProduct(
                  slides: images,
                  productId: widget.product.id,
                ),
                widget.product.category.contains('clothing')
                    ? SizeWidget(
                        controller: sizeController,
                      )
                    : Container(),
                Container(
                  height: widget.product.category.contains('clothing')
                      ? deviceHeight * 0.32
                      : deviceHeight * 0.42,
                  padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      widget.product.category.contains('clothing')
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: deviceHeight * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Color:',
                                    style: AppTextStyles.nameCharacteristics,
                                  ),
                                  ColorSelectWidget(
                                      controller: colorSelectController),
                                ],
                              ),
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description:',
                            style: AppTextStyles.nameCharacteristics,
                          ),
                          SizedBox(
                            width: deviceWidth * 0.65,
                            height: widget.product.category.contains('clothing')
                                ? deviceHeight * 0.07
                                : deviceHeight * 0.25,
                            child: SingleChildScrollView(
                              child: Text(
                                widget.product.description,
                                overflow: TextOverflow.fade,
                                style: AppTextStyles.characteristic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: deviceHeight * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Price:',
                              style: AppTextStyles.nameCharacteristics,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'pt_BR', symbol: 'R\$')
                                  .format(widget.product.price),
                              style: AppTextStyles.priceProduct,
                            ),
                          ],
                        ),
                      ),
                      const ButtonWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
