
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/colors.dart';
import 'package:kobis_xtra/pages/food_pages/food_category.dart';
import 'package:kobis_xtra/routes/approutes.dart';

import '../../common/App_Column.dart';
import '../../common/small_text.dart';
import '../../controllers/food_category_controller.dart';
import '../../models/food_category_model.dart';
import '../../utils/dimensions.dart';

class MainMenu extends StatelessWidget {

   MainMenu({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(

      //Category Section
        body: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Stack(
                children: [
          GetBuilder<FoodCategoryController> (builder: (categories){
            return categories.isLoaded? GridView.builder(
            gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
             mainAxisSpacing: 20),
              itemCount: categories.foodCategoryList.length,
              itemBuilder: (BuildContext ctx, index) {
                 return Stack(
                   children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.getFoodCategory(index));
                            },
               child: Container(
                          height: Dimensions.pageViewContainer,
                          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                            boxShadow:  const [
                                BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                offset: Offset (0, 5),)
                            ],
                          color: Appcolors.mainColor,
                          image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                          categories.foodCategoryList[index].categoryImageURL
                                  ),
                                ),
                              ),
               ),
                    ),
                Align(
                           alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius15),
                              ),
                              height: Dimensions.height10,
                              width: Dimensions.width10,
                              color: Colors.transparent,
                              child: BigText(text: categories.foodCategoryList[index].categoryName!,),
                            )),
                   ],

                        );
                     }
                   ): CircularProgressIndicator(
              color: Appcolors.mainColor,);
                   }),
    ],
    )

          ),

              );

  }
}


// Widget build(BuildContext context) {
//   return  Scaffold(
//     body: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           margin:  EdgeInsets.only(top: Dimensions.height30 *2,),
//           padding: EdgeInsets.only(left: Dimensions.width30, right:Dimensions.width30 ),
//           child: BigText(text: "Kobis Food Menu", color: Appcolors.mainColor, size: Dimensions.font26,),
//         ),
//         SmallText(text: "Always fresh...", size: Dimensions.font16),
//         SizedBox(height: Dimensions.height10,),
//         Container(
//           padding:  EdgeInsets.only(top: Dimensions.height10, left: 15, right: 15, bottom: Dimensions.height10),
//           decoration: BoxDecoration(
//             color: Appcolors.mainColor,
//             borderRadius: BorderRadius.circular(Dimensions.radius20),),
//           child:  Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: Dimensions.height10,),
//               BigText(text: 'Breakfast Menu Hours', color: Colors.white,),
//               SmallText(text: '08:00AM - 11:00AM', color: Colors.white),
//               SizedBox(height: Dimensions.height10, ),
//               BigText(text: 'Regular Menu Hours',color: Colors.white),
//               SmallText(text: '11:00AM - 3:00AM', color: Colors.white),
//             ],
//           ),
//         ),
//         SizedBox(height: Dimensions.height15,),
//
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(padding:EdgeInsets.only(left: Dimensions.width10) ),
//             BigText(text: "Breakfast Menu", size: Dimensions.font20,),
//             SizedBox(width : Dimensions.width10/2,),
//             Icon(Icons.arrow_drop_down_circle_outlined, color: Appcolors.mainColor,)
//           ],
//         ),
//
//         Expanded(child: SingleChildScrollView(
//           child: ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: 6,
//             itemBuilder: (context,index){
//               return  Container(
//                 margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
//                 child: Row(
//                   children: [
//                     //image section
//                     Container(
//                       height:Dimensions.listViewImgSize,
//                       width: Dimensions.listViewImgSize,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(Dimensions.radius20),
//                         color: Colors.white38,
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(
//                               'assets/images/Food0.jpg'
//                           ),
//                         ),
//                       ),
//                     ),
//                     //text container
//                     Expanded(
//                       child: Container(
//                         height: Dimensions.listViewTextContSize,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(Dimensions.radius20),
//                             bottomRight: Radius.circular(Dimensions.radius20),
//                           ),
//                           color: Colors.white,
//                         ),
//                         child: Padding(padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               BigText(text: 'Jellof Rice and Chicken'),
//                               SizedBox(height: Dimensions.height10,),
//                               SmallText(text: 'peppery jellof and fried chicken, e sweet die!'),
//                               SizedBox(height: Dimensions.height10,),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//
//                                   Wrap(
//                                     children: List.generate(5, (index) =>
//                                         Icon(Icons.star,
//                                           color: Appcolors.mainColor, size: 15,)),
//                                   ),
//                                   const SizedBox( width: 10,),
//
//                                   Icon(Icons.add_shopping_cart_outlined,
//                                     color: Appcolors.mainColor, size: 25,)
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ))
//       ],
//     ),
//   );
// }

// Container(
// height: Dimensions.pageViewContainer,
// margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(Dimensions.radius30),
// color: Appcolors.mainColor,
// image: DecorationImage(
// fit: BoxFit.cover,
// image: NetworkImage(
// categories.foodCategoryList[index].categoryImageURL
// ),
// ),
// ),
//
// ),

// Align(
// alignment: Alignment.bottomCenter,
// child: Container(
// height: Dimensions.pageViewTextContainer,
// margin:  EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(Dimensions.radius20),
// color: Colors.white,
// boxShadow:  [
// BoxShadow(
// color: Colors.black12,
// blurRadius: 5.0,
// offset: Offset (0, 5),
// ),
// BoxShadow(
// color: Colors.white,
// offset: Offset (-5, 0),
// ),
// BoxShadow(
// color: Colors.white,
// offset: Offset (5, 0),
// )
// ]
// ),
// child: Container(
// padding:  EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
// child: AppColumn(text:  categories.foodCategoryList[index].categoryName!,
// otherText: categories.foodCategoryList[index].categoryScript!,
// ),
// ) ,
// ),
// ),