import 'package:Medkit/models/schedule_model.dart';

class Medication {
  String name;
  String type = 'Pill';
  double dosage;
  double inventory;
  DateTime time;
  Schedule schedule;

  Medication({this.name, this.type, this.dosage, this.inventory, this.time, this.schedule});

  List<String> types = [
    'Pill',
    'Tablet',
    'Syringe',
    'Inhaler',
    'Drops'
  ];
}