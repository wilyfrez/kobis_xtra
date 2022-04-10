
import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;


  BigText({Key? key, this.color, required this.text,
    this.size= 0, this.overflow = TextOverflow.ellipsis, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        fontSize:size==0? Dimensions.font20:size,
      ),
    );
  }
}
