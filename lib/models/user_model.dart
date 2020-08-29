class UserModel {
  String uid;

  UserModel({this.uid});
}

class UserData {
  String name, email, gender, displayImageUrl;

  UserData({this.name, this.email, this.gender, this.displayImageUrl});

  Map<String, String> toMap (){
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'displayImageUrl': displayImageUrl
    };
  }
}