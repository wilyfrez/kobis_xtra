import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/app_icon.dart';
import 'package:kobis_xtra/common/colors.dart';
import 'package:kobis_xtra/controllers/popular_product_controllers.dart';
import 'package:kobis_xtra/controllers/product_category_controller.dart';
import 'package:kobis_xtra/models/product_category_model.dart';
import 'package:kobis_xtra/pages/widgets/expandable_text_widget.dart';
import 'package:kobis_xtra/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../home_screen/home_page.dart';

class FoodCategoryDetail extends StatelessWidget {
  int listID;
  FoodCategoryDetail({Key? key,required this.listID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductCategoryController>().productCategoryList[listID];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               GestureDetector(
                 onTap: (){
                   Get.to(()=> HomePage());
      },
                 child:  AppIcon(icon: Icons.clear,),
               ),
               // AppIcon(icon: Icons.shopping_cart_outlined,),
                GetBuilder<PopularProductController>(builder: (cart){
                  return Stack (
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right:3, top: 3,
                        child: AppIcon(icon: Icons.circle, size: 18, iconColor: Colors.transparent,
                          backgroundColor: Appcolors.mainColor,),
                      ):
                      Container(),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                          right:3, top: 3,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                            size: 12, color: Colors.white,)):
                      Container(),
                    ],
                  );
                },)
              ],
            ),
            bottom: PreferredSize(preferredSize:
              Size.fromHeight(20),
              child: Container(
                child: Center (child: BigText(size: Dimensions.font26,text: product.title,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Appcolors.mainColor,
            expandedHeight: 300,
           flexibleSpace: FlexibleSpaceBar(
             background: Image.network(
                 product.imageURL,
               width: double.maxFinite,
               fit: BoxFit.cover,
             ),
           ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),),
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  ),
                ],
              ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: Dimensions.width20*2.5,
                  right: Dimensions.width20*2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: (
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.setQuantity(false);
                        },
                        child: AppIcon(iconColor:Colors.white,
                          backgroundColor:Appcolors.mainColor,
                          icon: Icons.remove, iconSize: Dimensions.iconSearch24,),
                      ),
                      BigText(text: product.price + " X   ${controller.inCartItems}", size: Dimensions.font26,),
                      GestureDetector(
                        onTap: (){
                            controller.setQuantity(true);
                        },
                        child: AppIcon(iconColor:Colors.white,
                          backgroundColor:Appcolors.mainColor,
                          icon: Icons.add, iconSize: Dimensions.iconSearch24,),
                      )
                    ],
                  )
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Appcolors.mainColor,
                      )
                  ),
                 GestureDetector(
                   onTap: () {
                    controller.addItem(product);
                   },
                   child:  Container(
                     padding: EdgeInsets.only(top: Dimensions.height20,
                         bottom: Dimensions.height20,
                         left: Dimensions.width20, right: Dimensions.width20),
                     child: BigText(text: 'Add To Cart', color: Colors.white,),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(Dimensions.radius20),
                       color: Appcolors.mainColor,
                     ),
                   ),
                 )
                ],
              ),
            ),
          ],
        );
      })

    );
  }
}
