
class Medication {
  String name;
  String type = 'Pill';
  double dosage;
  double inventory;
  int hour;
  int minute;

  Medication({this.name, this.type, this.dosage, this.inventory, this.hour, this.minute});

  Medication.mapConstructor(Map<String, dynamic> map){
    name = map['name'];
    type = map['type'];
    dosage = map['dosage'];
    inventory = map['inventory'];
    hour = map['hour'];
    minute = map['minute'];
  }

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