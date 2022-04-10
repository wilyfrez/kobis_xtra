

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/colors.dart';

import '../../common/small_text.dart';
import '../../utils/dimensions.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:  EdgeInsets.only(top: Dimensions.height30 *2,),
            padding: EdgeInsets.only(left: Dimensions.width30, right:Dimensions.width30 ),
            child: BigText(text: "Kobis Food Menu", color: Appcolors.mainColor, size: Dimensions.font26,),
          ),
          SmallText(text: "Always fresh...", size: Dimensions.font16),
          SizedBox(height: Dimensions.height10,),
    Container(
    padding:  EdgeInsets.only(top: Dimensions.height10, left: 15, right: 15, bottom: Dimensions.height10),
        decoration: BoxDecoration(
          color: Appcolors.mainColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20),),
        child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height10,),
                BigText(text: 'Breakfast Menu Hours', color: Colors.white,),
                SmallText(text: '08:00AM - 11:00AM', color: Colors.white),
                SizedBox(height: Dimensions.height10, ),
                BigText(text: 'Regular Menu Hours',color: Colors.white),
                SmallText(text: '11:00AM - 3:00AM', color: Colors.white),
              ],
          ),
          ),
          SizedBox(height: Dimensions.height15,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding:EdgeInsets.only(left: Dimensions.width10) ),
              BigText(text: "Breakfast Menu", size: Dimensions.font20,),
              SizedBox(width : Dimensions.width10/2,),
              Icon(Icons.arrow_drop_down_circle_outlined, color: Appcolors.mainColor,)
            ],
          ),

          Expanded(child: SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context,index){
                return  Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      //image section
                      Container(
                        height:Dimensions.listViewImgSize,
                        width: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/Food0.jpg'
                            ),
                          ),
                        ),
                      ),
                      //text container
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Jellof Rice and Chicken'),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: 'peppery jellof and fried chicken, e sweet die!'),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Wrap(
                                      children: List.generate(5, (index) =>
                                          Icon(Icons.star,
                                            color: Appcolors.mainColor, size: 15,)),
                                    ),
                                    const SizedBox( width: 10,),

                                    Icon(Icons.add_shopping_cart_outlined,
                                      color: Appcolors.mainColor, size: 25,)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
