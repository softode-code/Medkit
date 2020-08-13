import 'package:flutter/material.dart';

import '../constants.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key key,
    @required this.title,
    @required this.subtitle,
    
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}