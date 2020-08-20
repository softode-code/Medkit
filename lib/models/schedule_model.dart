class Schedule {
  List<String> weekday = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
    'Saturday', 'Sunday'
    ];

  //0 for Everyday
  //1 for Every weekday
  //2 for Every X days
  int type;
  int xDays;
  
  Schedule({this.type, this.weekday, this.xDays});
}