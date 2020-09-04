import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/custom_drop_down_menu.dart';
import 'package:Medkit/shared/widgets/custom_text_input.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:Medkit/shared/widgets/wide_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NewMedication extends StatefulWidget {
  @override
  _NewMedicationState createState() => _NewMedicationState();
}

class _NewMedicationState extends State<NewMedication> {

  final _formkey = GlobalKey<FormState>();
  Medication _medication = Medication();

  void _showTimePicker(){
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    ).then((time) {
      setState(() {
        _medication.hour = time.hour;
        _medication.minute = time.minute;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserModel user = Provider.of<UserModel>(context);

    DatabaseService databaseService = DatabaseService(uid: user.uid);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              MainHeader(title: 'New Medication,', subtitle: 'Add a new medication to keep track of.'),
              SizedBox(height: 30,),
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextInput(
                      label: 'Medicine name',
                      hint: 'e.g: Asprin',
                      onChanged: (val) {
                        setState(() {
                          _medication.name = val;
                        });
                      },
                      validator: (val) => val.toString().isEmpty ? 'Please enter a medicine name' : null,
                    ),
                    SizedBox(height: defaultPadding,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Type',
                              style: inputLabelStyle,
                            ),
                            SizedBox(height: 10,),
                            CustomDropDownMenu(
                              itemList:_medication.types,
                              onChange: (val) {
                                setState(() {
                                  _medication.type = val;
                                });
                              },
                              value: _medication.type,
                            )
                          ],
                        ),
                        CustomTextInput(
                          width: 150,
                          label: 'Dosage',
                          hint: 'e.g: 1',
                          onChanged: (val) {
                            setState(() {
                              _medication.dosage = double.parse(val ?? '0');
                            });
                          },
                          validator: (val) => val == null ? 'Please enter a dose.' : null,
                          type: TextInputType.number
                        ),
                      ],
                    ),
                    SizedBox(height: defaultPadding,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: inputLabelStyle,
                        ),
                        Container(
                          
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: inputFieldColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: FlatButton(
                            onPressed:()  =>_showTimePicker(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  getTime(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.5)
                                  ),
                                ),
                                Icon(Icons.calendar_today, size: 24.0, color: Colors.black.withOpacity(0.5),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inventory',
                          style: inputLabelStyle
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'How much of this medication do you have?',
                              style: Theme.of(context).textTheme.caption.copyWith(color: subtitleColor),
                            ),
                            CustomTextFormField(
                              width: 100,
                              hint: 'e.g: 30',
                              type: TextInputType.number,
                              onChanged: (val) {
                                setState(() {
                                  _medication.inventory = double.parse(val);
                                });
                              },
                              validator: (val) {},
                            )
                          ],
                        ),
                      ],
                    ),
                    WidePrimaryButton(
                      size: size,
                      text: 'Add',
                      onPressed: () async {
                        await databaseService.addMedication(_medication);
                        Navigator.pop(context);
                      },
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


String getTime() {
  int hour =  TimeOfDay.now().hour;
  String minutes = TimeOfDay.now().minute.toString();
  String median = 'am';
  if (hour > 12){
    median = 'pm';
    hour = hour - 12;
  } else if (hour == 0){
    hour = 12;
  }
  return hour.toString()  + ':' + minutes +' '+ median;
}