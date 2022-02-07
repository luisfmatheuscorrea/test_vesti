import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/modules/product_details/controllers/color_select/color_select_controller.dart';

class ColorSelectWidget extends StatefulWidget {
  const ColorSelectWidget({Key? key, required this.controller})
      : super(key: key);

  final ColorSelectController controller;

  @override
  _ColorSelectWidgetState createState() => _ColorSelectWidgetState();
}

class _ColorSelectWidgetState extends State<ColorSelectWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Observer(
      builder: (context) => Row(
        children: List.generate(
          4,
          (index) => GestureDetector(
            onTap: () {
              widget.controller.selectColor(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: widget.controller.colorSelected == index
                    ? Border.all(
                        color: AppColors.borderBase,
                        width: 1.5,
                      )
                    : const Border(),
                borderRadius: BorderRadius.circular(1000),
                color: widget.controller.colorSelected == index
                    ? AppColors.grey
                    : Colors.transparent,
              ),
              padding: EdgeInsets.all(widget.controller.colorSelected == index
                  ? deviceWidth * 0.02
                  : (deviceWidth * 0.02) + 1.5),
              child: Container(
                width: deviceWidth * 0.07,
                height: deviceWidth * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: AppColors.clothingColors[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
