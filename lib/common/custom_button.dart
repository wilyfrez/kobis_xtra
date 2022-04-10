import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/theme_helper.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;


  const CustomButton ({ Key? key,required this.child,
    required this.onPressed}) : super (key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
      style: ThemeHelper().buttonStyle(),
        onPressed: (){
         onPressed();
        },
        child: child,
    )
    );
  }
}