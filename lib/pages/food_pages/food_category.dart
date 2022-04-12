import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/models/food_category_model.dart';
import 'package:kobis_xtra/models/product_category_model.dart';

import '../../common/app_icon.dart';
import '../../controllers/food_category_controller.dart';
import '../../controllers/product_category_controller.dart';
import '../../routes/approutes.dart';
import '../../utils/dimensions.dart';
import 'package:get/get.dart';

import '../home_screen/home_page.dart';


class FoodCategory extends StatelessWidget {
int listID;
  FoodCategory({Key? key, required this.listID}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   var category = Get.find<FoodCategoryController>().foodCategoryList[listID];
    return Scaffold(
           body: SingleChildScrollView(
            child: Column(
               children: [
                 SizedBox(height: Dimensions.height15 * 4,),
                 Container(
                   alignment: Alignment.topLeft,
                   child:  GestureDetector(
                       onTap : (){
                         Get.to(()=> HomePage());
                       },
                       child: AppIcon(icon: Icons.arrow_back_ios_outlined)),
                 ),
                 //
                 Container(
                     margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30,),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         BigText(text: category.categoryName,
                           color: Colors.black,
                           size: Dimensions.font26,
                         ),
                       ],
                     )
                 ),


                 GetBuilder<ProductCategoryController> (builder: (allProducts){
                 return ListView.builder(
                              scrollDirection: Axis.vertical,
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemCount: allProducts.items.length,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                              onTap: () {

                                 },
                                 child: Container(
                                   margin: EdgeInsets.only(
                                       left: Dimensions.width20,
                                       right: Dimensions.width20,
                                       bottom: Dimensions.height10),
                                   child: Container(
                                     height: Dimensions.height10,
                                     width: Dimensions.width20,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(Dimensions.radius30 * 2),

                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         //image
                                         Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                allProducts.categoryList[index].imageURL!
                                              ),
                                            ),
                                          ),
                                           height: Dimensions.height10/2,
                                           width:  Dimensions.width10/2,
                                         ),
                                         Container(
                                             height: Dimensions.height10/2,
                                             width:  Dimensions.width10/2,
                                           child: BigText(
                                             text:  allProducts.categoryList[index].title!
                                           )
                                         )
                                       ],
                                     ),
                                   )
                                 ),
                               );
                             },
                           )
               ],
             ),
           )
    );
  }
}
