import 'package:flutter/material.dart';

import '../common/Big_text.dart';
import '../common/colors.dart';
import '../utils/dimensions.dart';

class TrackMyOrder extends StatelessWidget {
  const TrackMyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          children : [
            Container(
              margin:  EdgeInsets.only(top: Dimensions.height30 *2, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width30, right:Dimensions.width30 ),
              child: BigText(text: "Track My Order!", color: Appcolors.mainColor, size: Dimensions.font26,),
            ),

          ],
        );
  }
}
