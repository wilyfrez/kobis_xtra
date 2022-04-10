import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/small_text.dart';

import '../utils/dimensions.dart';
import 'Big_text.dart';
import 'colors.dart';

class AppColumn extends StatelessWidget {
   String text;
   String otherText;

   AppColumn({Key? key, required this.text, required this.otherText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
              BigText(text: text, size: Dimensions.font20,),
              SizedBox( height: Dimensions.height10,),
          BigText(text: otherText , size: Dimensions.font16, color: Colors.redAccent,),
          SizedBox( height: Dimensions.height10/2,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Wrap(
                children: List.generate(5, (index) =>
                    Icon(Icons.star,
                      color: Appcolors.mainColor, size: 15,)),
              ),
              const SizedBox( width: 10,),

              Icon(Icons.shopping_cart,
                color: Colors.redAccent, size: 20,)
            ],
          ),


            ],
      );
  }
}
