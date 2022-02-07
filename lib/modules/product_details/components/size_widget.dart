import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/product_details/controllers/size/size_controller.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({Key? key, required this.controller}) : super(key: key);

  final SizeController controller;

  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    List<int> sizes = [4, 6, 8];

    return Container(
      padding: EdgeInsets.only(left: deviceWidth * 0.05),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.borderBase,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Size (US):',
            style: AppTextStyles.nameCharacteristics,
          ),
          Observer(
            builder: (context) => Row(
              children: List.generate(
                sizes.length,
                (index) => GestureDetector(
                  onTap: () {
                    widget.controller.selectSize(sizes[index]);
                  },
                  child: Container(
                    width: deviceWidth * 0.17,
                    height: deviceHeight * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: const Border(
                        left: BorderSide(
                          color: AppColors.borderBase,
                          width: 1.5,
                        ),
                      ),
                      color: widget.controller.sizeSelected == sizes[index]
                          ? AppColors.grey
                          : AppColors.white,
                    ),
                    child: Text(
                      sizes[index].toString(),
                      style: AppTextStyles.characteristic,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
