import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/home/medications/medication_tile.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/two_buttons.dart';
import 'package:flutter/material.dart';

class TakeMedicationDialog extends StatelessWidget {
  const TakeMedicationDialog({
    Key key,
    @required this.medication,
    @required this.onTakePressed,
    @required this.onCancelPressed,
  }) : super(key: key);

  final Medication medication;
  final Function onTakePressed;
  final Function onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(defaultPadding),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take Medication',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: defaultPadding),
            MedicationTile(
              medication: medication,
              showBoundary: false,
            ),
            SizedBox(height: defaultPadding/2,),
            Text(
              'Take '+ medication.dosage.toString() + ' '+ medication.type + '(s)',
              style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: defaultPadding),
            TwoButtons(
              saveBtnColor: primaryColor,
              primaryText: 'Take',
              onPrimaryPressed: onTakePressed,
              onSecondaryPressed: onCancelPressed,
            )
          ],
        ),
      )
    );
  }
}