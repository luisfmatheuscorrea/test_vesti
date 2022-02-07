import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
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
        'Add to basket',
        style: AppTextStyles.buttonWhite,
      ),
    );
  }
}
