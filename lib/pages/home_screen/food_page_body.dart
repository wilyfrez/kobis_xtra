
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/App_Column.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/colors.dart';
import 'package:kobis_xtra/common/small_text.dart';
import 'package:kobis_xtra/controllers/food_category_controller.dart';
import 'package:kobis_xtra/controllers/popular_product_controllers.dart';
import 'package:kobis_xtra/controllers/product_category_controller.dart';
import 'package:kobis_xtra/models/popular_products_model.dart';
import 'package:kobis_xtra/pages/food_pages/food_category.dart';
import 'package:kobis_xtra/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:kobis_xtra/routes/approutes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kobis_xtra/models/food_category_model.dart';



class FoodPageBody extends StatefulWidget {

  const FoodPageBody({Key? key,}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  var scrollcontroller = ScrollController();
  int activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
       GetBuilder<PopularProductController>(builder:(popularProducts) {
         return Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             popularProducts.isLoaded?CarouselSlider.builder(
               itemCount: popularProducts.popularProductList.length,
               itemBuilder: (BuildContext context, int index, int realIndex) {
                 return _buildPageItem(index,popularProducts.popularProductList[index] );
               },
               options: CarouselOptions(
                 viewportFraction: 0.80,
                 height: Dimensions.pageView,
                 enableInfiniteScroll: true,
                 autoPlay: true,
                 enlargeCenterPage: true,
                 autoPlayAnimationDuration: Duration(milliseconds: 800),
                 initialPage: 0,
                 autoPlayCurve: Curves.fastOutSlowIn,
                 onPageChanged: (index,reason){
                   setState(() =>activeIndex =index );
                 },
               ),
             ):
         CircularProgressIndicator(strokeWidth: 4.0, color: Appcolors.mainColor),
             SizedBox(height: Dimensions.height20,),
             buildIndicator(popularProducts),
           ],
         );
             }
         ),


        //popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'All Available Products',color: Colors.black,),
              SizedBox(width: Dimensions.width10,),
            ],
          )
        ),

        //all products
        GetBuilder<ProductCategoryController> (builder: (allProducts){
          return allProducts.isLoaded? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allProducts.productCategoryList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.getFoodCategoryDetail(index));
                },
                child: Container(
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
                            image: NetworkImage(
                                allProducts.productCategoryList[index].imageURL!
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
                                BigText(text: allProducts.productCategoryList[index].title!),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: allProducts.productCategoryList[index].title!),
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
                ),
              );
            },
          ): CircularProgressIndicator(
            color: Appcolors.mainColor,);
        } ,),
      ],
    );
  }


  Widget _buildPageItem(int index, popularProductModel popularProduct){
  return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.getPopularFood(index));
          },
          child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Appcolors.mainColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    popularProduct.bannerURL!
                  ),
                ),
              ),

          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin:  EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset (0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset (-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset (5, 0),
                  )
                ]
            ),
            child: Container(
              padding:  EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
              child: AppColumn(text: popularProduct.advertTitle!,
                otherText: popularProduct.advertSubTitle!,
              ),
            ) ,
          ),
        ),
      ],
    );


  }
  Widget buildIndicator <PopularProductController>(popularProducts) => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count:popularProducts.popularProductList.length,
    effect: JumpingDotEffect(
      dotColor: Colors.grey,
      activeDotColor: Appcolors.mainColor,
      dotWidth: 10.0,
      dotHeight: 10.0,
    ),
  );

}


