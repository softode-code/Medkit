import 'package:Medkit/res/colors.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    Key key,
    @required this.itemList,
    @required this.onChange,
    @required this.value, this.hint,
  }) : super(key: key);

  final List<String> itemList;
  final Function onChange;
  final String value;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding*0.3, horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: DropdownButton<String>(
        icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
        value: value,
        hint: Text( hint ?? 'Medicine type'),
        underline: Container(),
        onChanged: onChange,
        items: itemList
        .map<DropdownMenuItem<String>>((String listvalue){
          return DropdownMenuItem<String>(
            value: listvalue,
            child: Text(
              listvalue,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}