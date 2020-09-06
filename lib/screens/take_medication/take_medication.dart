import 'package:Medkit/models/medication_model.dart';
import 'package:flutter/material.dart';


class TakeMedication extends StatelessWidget {

  TakeMedication({this.medication});
  

  final String medication;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(medication),
      ),
    );
  }
}