import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_zummedy/core/app_colors.dart';
import 'package:test_zummedy/core/app_text_styles.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      height: 65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 25,
          )
        ],
        color: AppColors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 10,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: deviceWidth * 0.15,
                  height: deviceWidth * 0.15,
                  padding: const EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        color: AppColors.black.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 25,
                      )
                    ],
                    color: AppColors.white,
                  ),
                  child: Image.asset(
                    'assets/images/icons/shopping-bag.png',
                  ),
                ),
                Positioned(
                  top: -10,
                  child: Container(
                    width: deviceWidth * 0.052,
                    height: deviceWidth * 0.052,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          color: AppColors.primary.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 15,
                        )
                      ],
                      color: AppColors.primary,
                    ),
                    child: Text(
                      '01',
                      style: AppTextStyles.cartCounter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 22,
                color: AppColors.black,
                icon: const ImageIcon(
                  AssetImage('assets/images/icons/menu.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 22,
                color: AppColors.unselectedTitle,
                icon: const ImageIcon(
                  AssetImage('assets/images/icons/search.png'),
                ),
              ),
              const SizedBox(
                width: 22,
                height: 22,
              ),
              IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 22,
                color: AppColors.unselectedTitle,
                icon: const ImageIcon(
                  AssetImage('assets/images/icons/bookmark.png'),
                ),
              ),
              IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                iconSize: 22,
                color: AppColors.unselectedTitle,
                icon: const ImageIcon(
                  AssetImage('assets/images/icons/ci_settings.png'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
