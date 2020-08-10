import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key key,
    @required this.size,
    @required this.illustration,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final String illustration;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.6,
      width: size.width,
      child: Stack(
        children: [
          SvgPicture.asset(illustration, fit: BoxFit.fill, width: size.width,),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4
              ),
            ),
          )
        ],
      ),
    );
  }
}