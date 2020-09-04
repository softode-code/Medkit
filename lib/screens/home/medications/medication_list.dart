import 'package:flutter/material.dart';
import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/screens/home/medications/medication_tile.dart';

class MedicationList extends StatelessWidget {
  const MedicationList({
    Key key,
    @required this.medication,
  }) : super(key: key);

  final List<Medication> medication;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: medication.length,
        itemBuilder: (context, index){
          return MedicationTile(medication: medication[index],);
        }
      ),
    );
  }
}