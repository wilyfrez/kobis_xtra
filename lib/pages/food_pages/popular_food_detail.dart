import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/App_Column.dart';
import 'package:kobis_xtra/common/app_icon.dart';
import 'package:kobis_xtra/controllers/cart_controller.dart';
import 'package:kobis_xtra/controllers/popular_product_controllers.dart';
import 'package:kobis_xtra/pages/home_screen/home_page.dart';
import 'package:kobis_xtra/pages/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';


import '../../common/Big_text.dart';
import '../../common/colors.dart';
import '../../utils/dimensions.dart';

class PopularFoodDetail extends StatelessWidget {
int pageId;
  PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    //Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            left: 0, right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.bannerURL!
                    ),
                  )
                ),
              )),
          //icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
                GestureDetector(
                  onTap : (){
                    Get.to(()=> HomePage());
                  },
                    child: AppIcon(icon: Icons.arrow_back_ios)),

               GetBuilder<PopularProductController>(builder: (cart){
                 return Stack (
                   children: [
                     AppIcon(icon: Icons.shopping_cart_outlined),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right:0, top: 0,
                      child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent,
                      backgroundColor: Appcolors.mainColor,),
                    ):
                    Container(),
                     Get.find<PopularProductController>().totalItems>=1?
                         Positioned(
                             right:0, top: 0,
                             child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                             size: 12, color: Colors.white,)):
                         Container(),
                   ],
                 );
               },)
            ],
          )),
          //introduction of the food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize -20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn( text: product.advertTitle!, otherText: product.advertSubTitle!,),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: 'Description'),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(child: ExpandableTextWidget(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')),
                  ),
                ],
              )
            ),
          ),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return  Container(
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
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                         // popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: Colors.black26,)),
                    SizedBox(width: Dimensions.width10/2),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2),
                    GestureDetector(
                      onTap: (){
                       // popularProduct.setQuantity(true);
                      },
                        child: Icon(Icons.add, color: Colors.black26,)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  //popularProduct.addAdvertItem(popularProduct);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20, right: Dimensions.width20),
                    child: BigText(text:'Add To Cart', color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Appcolors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}
