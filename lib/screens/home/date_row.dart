import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/home/date_model.dart';
import 'package:Medkit/screens/home/date_tile.dart';
import 'package:flutter/material.dart';



class DateRow extends StatelessWidget {
  DateRow({
    Key key,
  }) : super(key: key);

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DateTile(
            boxDecoration: dateDecoration,
            date: DateModel(
              date: DateTime.now().subtract(Duration(days: 2)).day,
              weekday: days[DateTime.now().subtract(Duration(days: 2)).weekday-1]
            ),
            onTile: onWhiteBackground,
          ),
          DateTile(
            boxDecoration: dateDecoration,
            date: DateModel(
              date: DateTime.now().subtract(Duration(days: 1)).day,
              weekday: days[DateTime.now().subtract(Duration(days: 1)).weekday-1]
            ),
            onTile: onWhiteBackground,
          ),
          DateTile(
            boxDecoration: currentDateDecoration,
            date: DateModel(
              date: DateTime.now().day,
              weekday: days[DateTime.now().weekday-1]
            ),
            onTile: onPrimary,
          ),
          DateTile(
            boxDecoration: dateDecoration,
            date: DateModel(
              date: DateTime.now().add(Duration(days: 1)).day,
              weekday: days[DateTime.now().add(Duration(days: 1)).weekday-1]
            ),
            onTile: onWhiteBackground,
          ),
          DateTile(
            boxDecoration: dateDecoration,
            date: DateModel(
              date: DateTime.now().add(Duration(days: 2)).day,
              weekday: days[DateTime.now().add(Duration(days: 2)).weekday-1]
            ),
            onTile: onWhiteBackground,
          )
        ],
      ),
    );
  }
}


BoxDecoration currentDateDecoration = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [BoxShadow(
    offset: Offset(0,10),
    blurRadius: 15,
    color: primaryColor.withOpacity(0.4)
  )]
);

BoxDecoration dateDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [BoxShadow(
    offset: Offset(0,4),
    blurRadius: 10,
    color: Colors.black.withOpacity(0.08)
  )]
);