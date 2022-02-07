import 'package:flutter/material.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';
import 'package:test_zummedy/modules/cart/controllers/cart/cart_controller.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.onAdd,
    this.onRemove,
    this.amount,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final int? amount;

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    if (widget.onAdd != null && widget.onRemove != null) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: deviceWidth * 0.9,
          height: deviceHeight * 0.08,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: AppColors.primary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  color: AppColors.primary.withOpacity(0.4),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: widget.onRemove,
                child: const Icon(
                  Icons.remove,
                  color: AppColors.white,
                  size: 26,
                ),
              ),
              Center(
                child: Text(
                  widget.amount.toString(),
                  style: AppTextStyles.productCounter,
                ),
              ),
              GestureDetector(
                onTap: widget.onAdd,
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: deviceWidth * 0.9,
        height: deviceHeight * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 10,
                color: AppColors.primary.withOpacity(0.4),
              ),
            ]),
        child: Text(
          widget.text,
          style: AppTextStyles.buttonWhite,
        ),
      ),
    );
  }
}
