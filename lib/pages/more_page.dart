
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/colors.dart';

import '../utils/dimensions.dart';

class MorePage extends StatelessWidget {
  const MorePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Container(
                margin:  EdgeInsets.only(top: Dimensions.height30 *2, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width30, right:Dimensions.width30 ),
                child: BigText(text: "Kobis Xtra!", color: Appcolors.mainColor, size: Dimensions.font26,),
              ),
              SizedBox(height: Dimensions.height20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               SizedBox(width: Dimensions.width10,),
                Icon(Icons.person,color: Appcolors.mainColor,size :Dimensions.iconSearch24),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: 'My Account', color: Appcolors.mainColor,size: Dimensions.font20,),
              ],),
              SizedBox(height: Dimensions.height20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: Dimensions.width10,),
                  Icon(Icons.shopping_cart,color: Appcolors.mainColor,size: Dimensions.iconSearch24,),
                  SizedBox(width: Dimensions.width10,),
                  BigText(text: 'My Order History', color: Appcolors.mainColor,size: Dimensions.font20,),
                ],
              ),
            ],
    );
  }
}