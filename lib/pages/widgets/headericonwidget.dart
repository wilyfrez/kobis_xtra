import 'package:flutter/cupertino.dart';

import '../../utils/dimensions.dart';

class HeaderIconWidget extends StatefulWidget {
  const HeaderIconWidget({Key? key}) : super(key: key);

  @override
  _HeaderIconWidgetState createState() => _HeaderIconWidgetState();
}

class _HeaderIconWidgetState extends State<HeaderIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FittedBox(
            child: Image.asset("assets/images/Kobisicon2.png"),
            fit: BoxFit.contain
            ),
      );
  }
}
