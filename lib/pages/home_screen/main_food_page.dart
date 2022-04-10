
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/colors.dart';
import 'package:kobis_xtra/common/small_text.dart';

import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget{
  const MainFoodPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _MainFoodPageState();
  }
}

class _MainFoodPageState extends State<MainFoodPage>{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(
              margin:  EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right:Dimensions.width20 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height:Dimensions.height15,),
                      BigText(text: 'KobisXtra', color: Appcolors.mainColor,size: Dimensions.font26,),
                      Row(
                        children: [
                          SmallText(text: 'Hello, User',size: Dimensions.font16,),
                          const Icon(Icons.person_pin_circle_rounded, color: Colors.green,)
                        ],
                      )
                    ],

                  ),
                  Center(
                    child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search, color: Colors.white, size:Dimensions.iconSearch24,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: Appcolors.mainColor,
                        )
                    ),
                  )
                ],
              )
          ),
          //showing the body
          Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              )),
        ],
      )


    );
  }
  }