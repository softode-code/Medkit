class User {
  String name, email, gender, displayImageUrl;

  User({this.name, this.email, this.gender, this.displayImageUrl});

  Map<String, String> toMap (){
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'displayImageUrl': displayImageUrl
    };
  }
}