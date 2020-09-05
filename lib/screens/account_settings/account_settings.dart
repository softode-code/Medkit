import 'dart:io';
import 'package:Medkit/models/user_model.dart';
import 'package:Medkit/res/colors.dart';
import 'package:Medkit/screens/account_settings/logout_btn.dart';
import 'package:Medkit/screens/account_settings/profile_photo.dart';
import 'package:Medkit/services/database.dart';
import 'package:Medkit/services/storage.dart';
import 'package:Medkit/shared/constants.dart';
import 'package:Medkit/shared/widgets/custom_drop_down_menu.dart';
import 'package:Medkit/shared/widgets/custom_text_input.dart';
import 'package:Medkit/shared/widgets/main_header.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {

  final _formkey = GlobalKey<FormState>();

    String _username;
    String _gender;

    List<String> _genderList = ['Male', 'Female'];
    bool _valuesChanged = false;
    Color _saveBtnColor = Colors.grey;

    File _image;
    final picker = ImagePicker();

    Future getImage() async {
      final pickedfile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedfile.path);
        _valuesChanged = true;
        _saveBtnColor = primaryColor;
      });
    }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        UserData userData = snapshot.data;
        DatabaseService databaseService = DatabaseService(uid: user.uid);
        StorageService storageService = StorageService(uid: user.uid);

        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top:defaultPadding, right: defaultPadding, left: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LogoutBtn()
                      ],
                    ),
                    SizedBox(height: defaultPadding),
                    MainHeader(title: 'Account Settings', subtitle: ''),
                    SizedBox(height:defaultPadding),
                    ProfilePhoto(userData: userData, onPressed: getImage, image: _image,),
                    SizedBox(height: defaultPadding,),
                    Center(
                      child: Text(
                        userData.email,
                        style: TextStyle(
                          fontSize: 18,
                          color: subtitleColor,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding,),
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextInput(
                            label: 'User Name',
                            hint: 'username',
                            onChanged: (val) {
                              setState(() {
                                _username = val;
                                _saveBtnColor = primaryColor;
                                _valuesChanged = true;
                              });
                            },
                            validator: (val) => val.toString().isEmpty ? 'User name must not be empty': null,
                            value: userData.name
                          ),
                          SizedBox(height: defaultPadding,),
                          Text(
                            'Gender',
                            style: inputLabelStyle,
                          ),
                          SizedBox(height: 10),
                          CustomDropDownMenu(
                            itemList: _genderList,
                            onChange: (val) {
                              setState(() {
                                _gender = val;
                                _saveBtnColor = primaryColor;
                                _valuesChanged = true;
                              });
                            },
                            value: _gender ?? userData.gender,
                            hint: 'Select a gender',
                            
                          ),
                          SizedBox(height: defaultPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlineButton(
                                onPressed: () => Navigator.pop(context), 
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                                textColor: primaryColor,
                                color: primaryColor,
                                borderSide: BorderSide.none
                              ),
                              Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color: _saveBtnColor
                               ),
                               child: FlatButton(
                                 onPressed: () async {
                                   if(_valuesChanged){
                                     if(_formkey.currentState.validate()){
                                       String photoUrl;
                                       if (_image != null){
                                         await storageService.uploadProfilePhoto(_image).then((value) => photoUrl = value);
                                       }
                                       await databaseService.updateUserData(
                                         UserData(
                                           name: _username ?? userData.name,
                                           email: userData.email,
                                           gender: _gender ?? userData.gender,
                                           displayImageUrl: photoUrl ?? userData.displayImageUrl
                                         )
                                       );
                                       Navigator.pop(context);
                                     }
                                   }
                                   
                                 },
                                 child: Align(
                                   alignment: Alignment.center,
                                   child: Text(
                                     'Save',
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.w500,
                                       color: onPrimary
                                     ),
                                   ),
                                 ),
                               ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        );
      }
    );
  }
}