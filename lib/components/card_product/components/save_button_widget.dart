import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({Key? key}) : super(key: key);

  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget>
    with TickerProviderStateMixin {
  late AnimationController _saveAnimationController;

  @override
  void initState() {
    super.initState();
    _saveAnimationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _saveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        _saveAnimationController.forward();
      },
      child: SizedBox(
        width: deviceWidth * 0.13,
        height: deviceWidth * 0.15,
        child: Lottie.asset(
          'assets/jsons/bookmark_save.json',
          controller: _saveAnimationController,
          onLoaded: (composition) {
            _saveAnimationController.duration = composition.duration;
          },
        ),
      ),
    );
  }
}
