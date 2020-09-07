import 'package:flutter/material.dart';
import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/screens/home/medications/medication_tile.dart';
import 'package:provider/provider.dart';


class MedicationList extends StatefulWidget {
  const MedicationList({
    Key key,
  }) : super(key: key);


  @override
  _MedicationListState createState() => _MedicationListState();
}

class _MedicationListState extends State<MedicationList> {

  @override
  Widget build(BuildContext context) {

    final medications = Provider.of<List<Medication>>(context) ??[];

    return Expanded(
      child: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index){
          return MedicationTile(medication: medications[index], showBoundary: true,);
        }
      ),
    );
  }
}