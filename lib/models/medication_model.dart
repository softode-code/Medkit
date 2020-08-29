
class Medication {
  String name;
  String type = 'Pill';
  double dosage;
  double inventory;
  int hour;
  int minute;

  Medication({this.name, this.type, this.dosage, this.inventory, this.hour, this.minute});

  List<String> types = [
    'Pill',
    'Tablet',
    'Syringe',
    'Inhaler',
    'Drops'
  ];

  Map<String, dynamic> toMap (){
    return {
      'name': name,
      'type': type,
      'dosage': dosage,
      'inventory': inventory,
      'hour': hour,
      'minute': minute
    };
  }
}