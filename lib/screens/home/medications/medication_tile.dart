import 'package:flutter/material.dart';
import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/res/colors.dart';

class MedicationTile extends StatelessWidget {
  const MedicationTile({
    Key key, 
    @required this.medication,
  }) : super(key: key);

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding/1.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: Offset(0,4),
          blurRadius: 10
        )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                medication.name,
                style: TextStyle(
                  color: onWhiteBackground,
                  fontSize: 20
                ),
              ),
              Text(
                getTime(medication.hour, medication.minute),
                style: TextStyle(
                  fontSize: 14,
                  color: onWhiteBackground,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          SizedBox(height: defaultPadding/2,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text(
              medication.inventory.toString() +' pills Left',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14
              ),
            ),
          )
        ],
      ),
    );
  }
}

String getTime(int hour, int minute){
  String median = 'am';
  if (hour >12){
    hour = hour-12;
    median = 'pm';
  } else if (hour == 0) {
    hour = 12;
  } 
  return hour.toString() + ':' + minute.toString() +' '+ median;
}