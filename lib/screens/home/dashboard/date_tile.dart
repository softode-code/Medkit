import 'package:Medkit/screens/home/dashboard/date_model.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:flutter/material.dart';

class DateTile extends StatelessWidget {
  const DateTile({
    Key key,
    @required this.date,
    @required this.boxDecoration,
    @required this.onTile,
  }) : super(key: key);

  final DateModel date;
  final BoxDecoration boxDecoration;
  final Color onTile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding/1.5),
        child: Column(
          children: [
            Text(
              date.weekday,
              style: Theme.of(context).textTheme.caption.copyWith(color: onTile)
            ),
            SizedBox(height: 5,),
            Text(
              date.date.toString(),
              style: Theme.of(context).textTheme.caption.copyWith(color: onTile)
            ),
          ],
        ),
      ),
    );
  }
}