import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/app_icon.dart';
import 'package:kobis_xtra/common/colors.dart';

import '../../utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    AppIcon(icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                    backgroundColor: Appcolors.mainColor,
                    iconSize: Dimensions.iconSearch24,),

                  SizedBox(width: Dimensions.width20,),
                  AppIcon(icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: Appcolors.mainColor,
                    iconSize: Dimensions.iconSearch24,),

                  AppIcon(icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Appcolors.mainColor,
                    iconSize: Dimensions.iconSearch24,),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
