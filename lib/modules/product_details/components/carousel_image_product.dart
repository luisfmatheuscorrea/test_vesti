import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:test_zummedy/components/card_product/components/save_button_widget.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/modules/product_details/controllers/carousel_image/carousel_image_controller.dart';

class CarouselImageProduct extends StatefulWidget {
  const CarouselImageProduct({
    Key? key,
    required this.slides,
    required this.productId,
  }) : super(key: key);

  final List<Widget> slides;
  final int productId;

  @override
  _CarouselImageProductState createState() => _CarouselImageProductState();
}

class _CarouselImageProductState extends State<CarouselImageProduct> {
  final CarouselImageController controllerCarousel = CarouselImageController();
  final CarouselController _controller = CarouselController();
  late CarouselOptions carouselOptions;

  @override
  void initState() {
    carouselOptions = CarouselOptions(
        enlargeCenterPage: true,
        aspectRatio: 1.4,
        onPageChanged: (index, reason) {
          controllerCarousel.onPageChanged(index);
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: deviceWidth,
      height: deviceHeight * 0.45,
      child: Observer(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: widget.productId,
              child: CarouselSlider(
                items: widget.slides,
                carouselController: _controller,
                options: carouselOptions,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _controller.previousPage,
                  iconSize: 24,
                  splashRadius: 20,
                  splashColor: AppColors.grey,
                  highlightColor: AppColors.grey,
                  color: AppColors.greyDark,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
                IconButton(
                  onPressed: _controller.nextPage,
                  iconSize: 24,
                  splashRadius: 20,
                  splashColor: AppColors.grey,
                  highlightColor: AppColors.grey,
                  color: AppColors.greyDark,
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.slides.length,
                  (index) {
                    if (index == controllerCarousel.currentSlide) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 35,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      );
                    }
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 12,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColors.greyDark,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Positioned(
              right: 10,
              bottom: 0,
              child: SaveButtonWidget(),
            )
          ],
        ),
      ),
    );
  }
}
