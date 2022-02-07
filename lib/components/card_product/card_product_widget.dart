import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:test_zummedy/components/card_product/components/save_button_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';
import 'package:test_zummedy/modules/catalog/controllers/product/product_controller.dart';
import 'package:test_zummedy/modules/catalog/models/product/product_model.dart';
import 'package:test_zummedy/modules/product_details/product_details_page.dart';

class CardProductWidget extends StatefulWidget {
  const CardProductWidget({
    Key? key,
    required this.product,
    required this.controller,
    required this.cartController,
  }) : super(key: key);

  final Product product;
  final ProductController controller;
  final CartController cartController;

  @override
  _CardProductWidgetState createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    Product product = widget.product;
    int indexInCart = widget.cartController.cartProducts
        .indexWhere((cartProduct) => cartProduct.product.id == product.id);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              product: product,
              controller: widget.controller,
              cartController: widget.cartController,
            ),
          ),
        );
      },
      child: Container(
        width: deviceWidth * 0.5,
        height: deviceWidth * 0.65,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.borderBase,
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: deviceWidth * 0.5,
              height: deviceWidth * 0.65,
              padding: EdgeInsets.all(deviceWidth * 0.045),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      width: deviceWidth * 0.4,
                      height: deviceWidth * 0.41,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    NumberFormat.currency(locale: "pt_BR", symbol: 'R\$')
                        .format(product.price),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.35,
                    child: Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w900,
                        color: AppColors.unselectedTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: deviceWidth * 0.1,
                height: deviceWidth * 0.27,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    AnimatedContainer(
                      width: deviceWidth * 0.1,
                      height: indexInCart != -1
                          ? deviceWidth * 0.27
                          : deviceWidth * 0.1,
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(deviceWidth * 0.05),
                        ),
                      ),
                    ),
                    Container(
                      width: deviceWidth * 0.1,
                      height: deviceWidth * 0.27,
                      // height: deviceWidth * 0.1,
                      padding: const EdgeInsets.only(top: 1, left: 1),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 400),
                              opacity: indexInCart != -1 ? 1 : 0,
                              child: GestureDetector(
                                onTap: () {
                                  if (indexInCart != -1) {
                                    widget.cartController.addProduct(product);
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                opacity: indexInCart != -1 ? 1 : 0,
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: AppTextStyles.productCounter,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.cartController.addProduct(product);
                              },
                              child: const Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              right: 0,
              top: 0,
              child: SaveButtonWidget(),
            )
          ],
        ),
      ),
    );
  }
}
