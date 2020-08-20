import 'package:Medkit/models/medication_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/home/medications/medications.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/custom_drop_down_menu.dart';
import 'package:Medkit/shared/widgets/custom_text_input.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:Medkit/shared/widgets/wide_primary_button.dart';
import 'package:flutter/material.dart';


class NewMedication extends StatefulWidget {
  @override
  _NewMedicationState createState() => _NewMedicationState();
}

class _NewMedicationState extends State<NewMedication> {

  final _formkey = GlobalKey<FormState>();
  Medication _medication = Medication();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            MainHeader(title: 'New Medication,', subtitle: 'Add a new medication to keep track of.'),
            SizedBox(height: 30,),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
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
                              _medication.dosage = double.parse(val);
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
                      onPressed: () {
                        print(_medication.name);
                        print(_medication.dosage);
                        print(_medication.type);
                        print(_medication.inventory);
                      },
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}



